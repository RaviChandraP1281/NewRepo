/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the "Quote" object (API Name: Quote).
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
*   After  Insert
*   After  Update
*   Before Insert
*
* The framework for dispatching additional Trigger Actions has been left in place.  To activate 
* these additional dispatch calls, un-comment the appropriate lines of code.  Before doing so, 
* make sure that the corresponding method in the handler class has been implemented.
*
* IMPORTANT!  Under no circumstance should additional logic be placed here, within this Trigger 
* definition.  Trigger logic should ONLY be implemented by the Trigger Handler class, or classes
* called by the Trigger Handler class.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       --
* @modifiedby   Deep Diwakar <deep_diwakar@intuit.com>
* @version      1.1
* @created      --
* @modified     11-MAY-2015
* @systemlayer  Invocation
* @see          QuoteTriggerHandler.class
* @see          Quote.object
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.1          Deep Diwakar
* 2014-10-20    Replaced old trigger body with the Intuit standard trigger action delegation
*               pattern.  Old trigger body was maintained, commented out, at the end of this file.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

trigger QuoteTrigger on Quote (before insert, after insert, before update, after update, 
                                before delete, after delete, after undelete) {
    
    /* Before Insert */
  if (trigger.isBefore && trigger.isInsert) {
     	QuoteTriggerHandler.beforeInsert(trigger.new);
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
  if (trigger.isAfter && trigger.isInsert) {
        QuoteTriggerHandler.afterInsert(trigger.newMap, trigger.oldMap);
    }
  /* After Update */
  if (trigger.isAfter && trigger.isUpdate) {
        QuoteTriggerHandler.afterUpdate(trigger.newMap, trigger.oldMap);   
    }
  /* After Delete */
  //else if (trigger.isDelete && trigger.isAfter) {
  //  handler.onAfterDelete(trigger.old, trigger.oldMap);
  //}
  /* After Undelete */
  //else if (trigger.isUnDelete) {
  //  handler.onAfterUndelete(trigger.new);
  //}
}


// OLD CODE BELOW!
// if (trigger.isAfter && trigger.isInsert) {
//        QuoteTriggerHandler.afterInsert(trigger.newMap, trigger.oldMap);
//    }
//    if (trigger.isAfter && trigger.isUpdate) {
//        QuoteTriggerHandler.afterUpdate(trigger.newMap, trigger.oldMap);   
//    }
//   if (trigger.isBefore && trigger.isInsert) {
//    	QuoteTriggerHandler.beforeInsert(trigger.new);
//   }