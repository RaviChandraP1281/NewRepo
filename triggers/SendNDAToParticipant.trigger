trigger SendNDAToParticipant on Participants__c(after insert, after update) {

    List < Participants__c > participants = new List < Participants__c > ();

    string franceNDAName = 'Intuit France_MNDA';
    string brazilNDAName = 'Brazil - Zeropaper - MNDA & Release Form (Portuguese)';


    if (trigger.isInsert) {
        participants.addAll(trigger.new);
    }
    /*
    * SRS- 678
    * Description - Unable to send NDA from the Customer Connect Portal
    * Start
    */
    if (trigger.isUpdate) {
        for (Participants__c participant: trigger.new) {
            if (Trigger.newMap.get(participant.Id).NDA_Signed__c == false && Trigger.newMap.get(participant.Id).NDASendDate__c != null 
            && Trigger.newMap.get(participant.Id).NDASendDate__c != Trigger.oldMap.get(participant.Id).NDASendDate__c ) {
                participants.add(participant);
            }
        }
    }
    //END
    if (participants.size() > 0) {
        //call function to send email
        Set < Id > franceParticipants = new Set < Id > ();
        Set < Id > brazilParticipants = new Set < Id > ();
        Set < Id > otherParticipants = new Set < Id > ();

        Map < Id, Participants__c > participantMap = new Map < Id, Participants__c > ([Select ID, NDA_Document__r.Name from Participants__c where Id in : Trigger.newMap.KeySet()]);
        system.debug('Map Part id' + participantMap);
        for (Participants__c prt: participants) {
            // System.debug('listpartid: '+prt.Id);
            if (prt.NDA_Signed__c == false && participantMap.get(prt.Id).NDA_Document__r.Name != null) {
                if (participantMap.get(prt.Id).NDA_Document__r.Name == franceNDAName && (prt.Email__c != '' && prt.Email__c != null)) {
                    franceParticipants.Add(prt.Id);
                } else if (participantMap.get(prt.Id).NDA_Document__r.Name == brazilNDAName && (prt.Email__c != '' && prt.Email__c != null)) {
                    brazilParticipants.Add(prt.Id);
                } else if ((prt.Email__c != '' & prt.Email__c != null) && (participantMap.get(prt.Id).NDA_Document__r.Name != '' && participantMap.get(prt.Id).NDA_Document__r.Name != null)) {
                    otherParticipants.Add(prt.Id);
                }
            }
        }
        try {
            if (franceParticipants.size() > 0) {
                SendingEmail.sendEmailtoparticipantsreceivingtheFranceNDA(franceParticipants);
            }

            if (brazilParticipants.size() > 0) {
                SendingEmail.sendEmailtoparticipantsreceivingtheBrazilNDA(brazilParticipants);
            }
            if (otherParticipants.size() > 0) {
                SendingEmail.sendEmailtoparticipantsreceivingallotherNDAs(otherParticipants);
            }
        } catch (Exception ex) {
            throw ex;
        }

    }

}