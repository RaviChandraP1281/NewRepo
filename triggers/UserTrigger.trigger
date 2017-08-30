trigger UserTrigger on User (after update,before update, before insert,after insert) {
  if(Trigger.isBefore && Trigger.isInsert) {
    UserTriggerHandler.onBeforeInsert(Trigger.new);  
  }
  else if(Trigger.isAfter && Trigger.isInsert) {
    UserTriggerHandler.onAfterInsert(Trigger.new);
  } 
  else if(Trigger.isBefore && Trigger.isUpdate) { 
     UserTriggerHandler.onBeforeUpdate(Trigger.new,Trigger.oldMap);  
  }
  else if(Trigger.isAfter && Trigger.isUpdate) {
    UserTriggerHandler.onAfterUpdate(Trigger.new,Trigger.oldMap);
  }
  
}