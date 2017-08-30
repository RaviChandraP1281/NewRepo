/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the Lead object (Standard Object).
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
* @author       Unknown
* @modifiedby   Vivek M. Chawla     <Vivek_Chawla@Intuit.com>
* @version      0.90
* @created      Unknown
* @modified     2014-07-23
* @see          LeadTriggerHandler.class
* @see          DefaultPreferenceUtils.class
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger LeadTrigger on Lead (before insert, before update,  before delete, 
                             after insert,  after update,   after delete, 
                             after undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Trigger 
  // Action Handler Method. Note that additional logic may be implemented in
  // Service classes outside of the Trigger Handler class.
  // TODO: Vivek needs to update the LeadTriggerHandler class so that it 
  //       exposes instance methods for the handlers, and NOT static methods as
  //       is currently implemented.
  //───────────────────────────────────────────────────────────────────────────┘
  //LeadTriggerHandler handler = new LeadTriggerHandler(trigger.size);

  /* Before Insert */
  if (trigger.isInsert && trigger.isBefore) {
    LeadTriggerHandler.beforeInsert(trigger.new);
    //handler.onBeforeInsert(trigger.new);
  }
  /* Before Update */
  else if (trigger.isUpdate && trigger.isBefore) {
    LeadTriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);
    //handler.onBeforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);  
  }
  /* Before Delete */
  //else if (trigger.isDelete && trigger.isBefore) {
  //  handler.onBeforeDelete(trigger.old, trigger.oldMap);
  //}
  /* After Insert */
  else if (trigger.isInsert && trigger.isAfter) {
    LeadTriggerHandler.afterInsert(trigger.new);        
    //handler.onAfterInsert(trigger.new, trigger.newMap);
  }
  /* After Update */
  else if (trigger.isUpdate && trigger.isAfter) {
    LeadTriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
    //handler.onAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
  /* After Delete */
  //else if (trigger.isDelete && trigger.isAfter) {
  //  handler.onAfterDelete(trigger.old, trigger.oldMap);
  //}
  /* After Undelete */
  //else if (trigger.isUnDelete) {
  //  handler.onAfterUndelete(trigger.new);
  //}
  /* Always Execute */
  DefaultPreferenceUtils.getValues(Trigger.new, Trigger.old, Trigger.isBefore);
}






/*
//
// ORIGINAL CODE:
//
trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {
    if (trigger.isBefore && trigger.isInsert)
        LeadTriggerHandler.beforeInsert(trigger.new);
    else if (trigger.isAfter && trigger.isInsert)
        LeadTriggerHandler.afterInsert(trigger.new);        
    else if (trigger.isBefore && trigger.isUpdate)
        LeadTriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);
    else if (trigger.isAfter && trigger.isUpdate)
        LeadTriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
    DefaultPreferenceUtils.getValues(Trigger.new, Trigger.old, Trigger.isBefore);
}
*/