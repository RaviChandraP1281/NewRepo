trigger StudyLabTrigger on Study_Lab__c (before insert) {
/*
	Trigger: StudyLabTrigger
	Modified By: Aditya Nagulapalli
	Modified Date: 6/1/2016
	Modified Version: 1.1
*/
  //───────────────────────────────────────────────────────────────────────────┐
  // BEFORE INSERT
  //───────────────────────────────────────────────────────────────────────────┘
  if (trigger.isBefore && trigger.isInsert) {
    StudyLabTriggerHandler.beforeInsertAction(trigger.new);
  }
  //───────────────────────────────────────────────────────────────────────────┐
  // AFTER INSERT
  //───────────────────────────────────────────────────────────────────────────┘
  if (trigger.isAfter && trigger.isInsert) {

  }
  //───────────────────────────────────────────────────────────────────────────┐
  // BEFORE UPDATE
  //───────────────────────────────────────────────────────────────────────────┘
   if (trigger.isBefore && trigger.isUpdate) {
    
  }
  //───────────────────────────────────────────────────────────────────────────┐
  // AFTER UPDATE 
  //───────────────────────────────────────────────────────────────────────────┘
  if(trigger.isAfter && trigger.isUpdate){
  }
}