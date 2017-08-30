/**
    @Author : Durga Ayinala
    @Created Date : 06-13-2016
    @Description : This update name with Participant name
*/

trigger updateNameOfParticipant on Participant_Survey_Feedback__c (before insert) {

    if(Trigger.isInsert && Trigger.isbefore){
        List<Id> participantIdList = new List<Id>();
        
        for(Participant_Survey_Feedback__c partSurveyFBObj : Trigger.new){
            
            if(partSurveyFBObj.Study_Participant__c != null){
                participantIdList.add(partSurveyFBObj.Study_Participant__c);
             }
        }
        
        if(participantIdList.size() > 0){
            ParticipantSurveyHelper.nameUpdateonParticipantSurvey(participantIdList,Trigger.new);
         }
    }
}