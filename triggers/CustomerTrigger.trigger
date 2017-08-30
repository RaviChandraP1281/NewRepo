trigger CustomerTrigger on Customer__c(before insert,before update, after insert , after update) 
  {
  
       if (trigger.isBefore && (trigger.isInsert || trigger.isUpdate))
       {
            CustomerTriggerHelper.Phone_formatting(trigger.new);
       }      
  
  }