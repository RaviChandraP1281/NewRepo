/**
    @Author : Durga Prasad Ayinala
    @Description : when calender event is assigned to Participant, sends the confirmation email to Participant
*/
trigger EMailToPartcipantOnAssignCalenderEvent on Studio_Calender__c (after insert, before insert, before update) {

    if(Trigger.isInsert && Trigger.isBefore)
    { 
        for(Studio_Calender__c stdCalenderObj : Trigger.new){
            if(stdCalenderObj.Start_Time__c != null)
                stdCalenderObj.Start_time_Only__c = stdCalenderObj.Start_Time__c.format('hh:mm a');
            if(stdCalenderObj.End_Time__c != null)
                stdCalenderObj.End_Time_Only__c = stdCalenderObj.End_Time__c.format('hh:mm a');
        }
    }
    
     if(Trigger.isUpdate && Trigger.isBefore)
    { 
        for(Studio_Calender__c stdCalenderObj : Trigger.new){
            if(stdCalenderObj.Start_Time__c != null && trigger.oldMap.get(stdCalenderObj.Id).Start_Time__c != stdCalenderObj.Start_Time__c)
                stdCalenderObj.Start_time_Only__c = stdCalenderObj.Start_Time__c.format('hh:mm a');
            if(stdCalenderObj.End_Time__c != null && trigger.oldMap.get(stdCalenderObj.Id).End_Time__c != stdCalenderObj.End_Time__c)
                stdCalenderObj.End_Time_Only__c = stdCalenderObj.End_Time__c.format('hh:mm a');
        }
    }
    
    
    
    if(Trigger.isInsert && Trigger.isAfter)
    {
    List<Id> stdCalIdList = new List<Id>();
    
    for(Studio_Calender__c stdCalenderObj : Trigger.new){
            
            if(stdCalenderObj.Study_Participant__c != null){
                
                stdCalIdList.add(stdCalenderObj.id);
                System.debug('id is '+stdCalenderObj.id);
                System.debug('id is '+stdCalIdList);
            }
     }
    
    //Send Email to Participant when calender is assigned .
    if(stdCalIdList!= null && stdCalIdList.size() > 0){
        SendingEmail.sendConfirmEmailToParticipant(stdCalIdList);
     }
    }
}