/**
    @Author : Durga Prasad Ayinala
    @Description : when participant attended study and recruiter updated attendance flag,system sends Thank you email to participant
*/
trigger ParticipantEMail on Study_Participant__c (before update,after update) {

    List<Id> studyPartIDList = new List<Id>();
    List<Id> confirmStdPartId = new List<Id>();
    
    if(Trigger.isupdate && Trigger.isafter){
        for(Study_Participant__c studyPartObj : Trigger.new){
        
            if(studyPartObj.Attended_Study__c && studyPartObj.Attended_Study__c != Trigger.oldMap.get(studyPartObj.id).Attended_Study__c){
                
                studyPartIDList.add(studyPartObj.id);
            }
            
            system.debug(' studyPartObj.Confirmation_of_participant__c : '+studyPartObj.Confirmation_of_participant__c);
            system.debug('Trigger.oldMap.get(studyPartObj.id).Confirmation_of_participant__c  : ' +Trigger.oldMap.get(studyPartObj.id).Confirmation_of_participant__c);
            
            
            if(studyPartObj.Confirmation_of_participant__c != null && studyPartObj.Confirmation_of_participant__c != Trigger.oldMap.get(studyPartObj.id).Confirmation_of_participant__c){
                
                confirmStdPartId.add(studyPartObj.id);
                system.debug('entered here in the trigger : ' +confirmStdPartId);
            }
            
             
            
        }
         //When participant confirms the meeting the email is sent to the recruiter
        if(!confirmStdPartId.isEmpty()){
        		system.debug('confirmStdPartId  :' +confirmStdPartId);
            SendingEmail.sendParticipantMeetingDecisiontoRecruiter(confirmStdPartId);
        }
         
        //When Participent attended study, send them Thank you mail
        if(studyPartIDList != null && studyPartIDList.size() > 0){
            
            SendingEmail.sendEmailToParticipant(studyPartIDList);
        }
    }
    
    
 
}