/**
    @Author : Durga Ayinala
    @Created Date : 06-09-2016
    @Description : Sends email to Potential Participant with Survey link
*/
trigger EMailToParticipant on Participants__c (before update,before insert) {
    
    List<Participants__c> participantObjList = new List<Participants__c>();
    if(Trigger.isupdate){
        for(Participants__c participantObj : Trigger.new){
            
            if(participantObj.Send_Survey_Email__c && participantObj.Send_Survey_Email__c != Trigger.oldmap.get(participantObj.id).Send_Survey_Email__c){
            
                participantObjList.add(participantObj);
            }
        }
    }
    if(Trigger.isinsert){
        for(Participants__c participantObj : Trigger.new){
            
            if(participantObj.Send_Survey_Email__c){
            
                participantObjList.add(participantObj);
            }
        }
    }
    
    if(participantObjList != null && participantObjList.size() >0){
    
        SendingEmail.sendEmailToPotentialPart(participantObjList);
    }
    

}