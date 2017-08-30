trigger RenewalsTrigger on Renewals__c (before insert, before update) {
  /* Before Insert */
  if (trigger.isBefore && trigger.isInsert) {
    RenewalsTriggerHandler.beforeInsert(trigger.new);
  } 
  /* Before update */
  else if (trigger.isUpdate && trigger.isBefore) {
  	RenewalsTriggerHandler.beforeUpdate(trigger.newMap, trigger.oldMap );
  } 
}