/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the AMX_Member_Distribution__c object.
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
*   Before Insert
*   Before Update
*   After  Insert
*   After  Update
*
* The framework for dispatching additional Trigger Actions has been left in place.  To activate 
* these additional dispatch calls, un-comment the appropriate lines of code.  Before doing so, 
* make sure that the corresponding method in the handler class has been implemented.
*
* IMPORTANT!  Under no circumstance should additional logic be placed here, within this Trigger 
* definition.  Trigger logic should ONLY be implemented by the Trigger Handler class, or classes
* called by the Trigger Handler class.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       Sunil Sharma      <Sunil_Sharma3@Intuit.com>
* @modifiedby   Vivek M. Chawla   <Vivek_Chawla@Intuit.com>
* @version      1.0
* @created      2014-12-28
* @modified     2015-01-12
* @see          AMX_MemberDistributionTriggerHandler.class
* @see          AMX_MemberDistributionServices.class
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v0.9          Sunil_Sharma3@Intuit.com
* 2014-12-28    Initial implementation.
*
* v1.0          Vivek_Chawla@Intuit.com
* 2015-01-12    Changed class to work as instance class instead of static class in order to conform
*               to standard Trigger Handler pattern.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger AMX_MemberDistributionTrigger on AMX_Member_Distribution__c (before insert, before update, 
                                                                     after  insert, after  update, 
                                                                     before delete, after  delete, 
                                                                     after  undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Action  
  // Handler Method.
  //───────────────────────────────────────────────────────────────────────────┘
  AMX_MemberDistributionTriggerHandler handler = new AMX_MemberDistributionTriggerHandler();

  /* Before Insert */
  if (trigger.isInsert && trigger.isBefore) {
    handler.onBeforeInsert(trigger.new);
  }
  /* Before Update */
  //else if (trigger.isUpdate && trigger.isBefore) {
  //  handler.onBeforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  //}
  /* Before Delete */
  //else if (trigger.isDelete && trigger.isBefore) {
  //  handler.onBeforeDelete(trigger.old, trigger.oldMap);
  //}
  /* After Insert */
  else if (trigger.isInsert && trigger.isAfter) {
    handler.onAfterInsert(trigger.new, trigger.newMap);
  }
  /* After Update */
  else if (trigger.isUpdate && trigger.isAfter) {
    handler.onAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
  /* After Delete */
  else if (trigger.isDelete && trigger.isAfter) {
    handler.onAfterDelete(trigger.old, trigger.oldMap);
  }
  /* After Undelete */
  //else if (trigger.isUnDelete) {
  //  handler.onAfterUndelete(trigger.new);
  //}
}