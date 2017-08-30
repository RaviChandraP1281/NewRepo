/**
    @Author : Chetan Dawale
    @Description : This trigger creates Employee_Study_Time object on creation of Study_Time with consecutive time slots of 30 minutes
*/

trigger AddEmployeeStudyTime on Studio_Calender__c (after insert,before delete){

    if(Trigger.isDelete && Trigger.isBefore) { 
		UpdateStudyParticipantHandler.updateIsInvitedBeforeDelete(Trigger.old);
	}

    if(Trigger.isInsert && Trigger.isAfter) { 
        List<Employee_Study_Time__c> lstEmployee_Study_Time = new List<Employee_Study_Time__c>();
        Map<id,Studio_Calender__c> lstRequestType =  new Map<id,Studio_Calender__c>([SELECT Id,Study_Participant__r.study__r.Request_type__c from Studio_Calender__c where id IN: Trigger.newMap.keySet()]);
		for(Studio_Calender__c stdCalenderObj : Trigger.new){
			if(stdCalenderObj.Start_Time__c != null && stdCalenderObj.End_Time__c != null && lstRequestType.get(stdCalenderObj.id).Study_Participant__r.study__r.Request_type__c == 'Office Hours'){
                      
     /** JIRA# SRS-205
			 * -------------------------------------------------------------------------------------------------
     * Description :- Extra Study Time entries are being created when scheduling Participants for a Study
			 * --------------------------------------------------------------------------------------------------
     *  Start
    **/

                        Datetime startdt = stdCalenderObj.Start_Time__c;
                        Datetime enddt = stdCalenderObj.End_Time__c;

				while(startdt < enddt){
                             Employee_Study_Time__c objEmployee_Study_Time = new Employee_Study_Time__c();
                             objEmployee_Study_Time.Start_Time__c = startdt.format('hh:mm a');
                             objEmployee_Study_Time.End_Time__c = startdt.addMinutes(30).format('hh:mm a');
                             objEmployee_Study_Time.Start_DateTime__c = startdt;
                             startdt = startdt.addMinutes(30);
                             objEmployee_Study_Time.End_DateTime__c = startdt;
                             objEmployee_Study_Time.Study_Time__c = stdCalenderObj.id;
                             lstEmployee_Study_Time.add(objEmployee_Study_Time);
                         }
                    }
        }
  /** JIRA# SRS-205 END  */
		if(!lstEmployee_Study_Time.isEmpty()){
      insert lstEmployee_Study_Time;
    }
    }
}