/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the "Study" object (API Name: Study__c).
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
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
* @author       DurgaPrasad Ayinala
* @modifiedby   Aditya nagulapalli 
* @version      1.1
* @created      2016-07-01
* @modified     2016-07-01
* @systemlayer  Invocation
* @see          StudyTriggerHandler.class
* @see          Study__c.object
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.1          Aditya_Nagulapalli@Intuit.com
* 2014-10-20    Replaced old trigger body with the Intuit standard trigger action delegation
*               pattern.  Old trigger body was maintained, commented out, at the end of this file.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger StudyTrigger on Study__c (before insert, before update, before delete, 
                               after insert,  after update,  after delete,  
                               after undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Trigger 
  // Action Handler Method. Note that additional logic may be implemented in
  // Service classes outside of the Trigger Handler class.
  //───────────────────────────────────────────────────────────────────────────┘
  StudyTriggerHandler handler = new StudyTriggerHandler(trigger.size);

  /* Before Insert */
  //if (trigger.isInsert && trigger.isBefore) {
   // handler.onBeforeInsert(trigger.new);
  //}
  /* Before Update */
  if (trigger.isUpdate && trigger.isBefore) {
    handler.onBeforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
  /* Before Delete */
  //else if (trigger.isDelete && trigger.isBefore) {
  //  handler.onBeforeDelete(trigger.old, trigger.oldMap);
  //}
  /* After Insert */
  //if (trigger.isInsert && trigger.isAfter) {
   // handler.onAfterInsert(trigger.new, trigger.newMap);
  //}
  /* After Update */
  else if (trigger.isUpdate && trigger.isAfter) {
   handler.onAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
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