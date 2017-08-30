/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the "AMX Distributor" object (AMX_Distributor__c).
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
*   Before Insert
*   Before Update
*   Before Delete
*   After  Insert
*   After  Update
*   After  Delete
*   After  Undelete
*
* The framework for dispatching additional Trigger Actions has been left in place.  To activate 
* these additional dispatch calls, un-comment the appropriate lines of code.  Before doing so, 
* make sure that the corresponding method in the handler class has been implemented.
*
* IMPORTANT!  Under no circumstance should additional logic be placed here, within this Trigger 
* definition.  Trigger logic should ONLY be implemented by the Trigger Handler class, or classes
* called by the Trigger Handler class.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       Vivek M. Chawla     <Vivek.M.Chawla@gmail.com>
* @modifiedby   Vivek M. Chawla     <Vivek.M.Chawla@gmail.com>
* @version      1.0
* @created      YYYY-MM-DD
* @modified     YYYY-MM-DD
* @systemlayer  Invocation
* @see          AMX_DistributorTriggerHandler.class
* @see          AMX_DistributorServices.class
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* vX.X          Vivek.M.Chawla@gmail.com
* YYYY-MM-DD    Explanation of the change.  Multiple lines can be used to explain the change, but
*               each line should be indented till left aligned with the previous description text.
*
* vX.X          Vivek.M.Chawla@gmail.com
* YYYY-MM-DD    Explanation of the change.  Multiple lines can be used to explain the change, but
*               each line should be indented till left aligned with the previous description text.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger AMX_DistributorTrigger on AMX_Distributor__c (before insert, before update, before delete, 
                                                      after insert,  after update,  after delete, 
                                                      after undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Action  
  // Handler Method (eg. BEFORE INSERT or AFTER UPDATE).
  //───────────────────────────────────────────────────────────────────────────┘
  AMX_DistributorTriggerHandler handler = new AMX_DistributorTriggerHandler();

  /* Before Insert */
  //if (trigger.isInsert && trigger.isBefore) {
  //  handler.beforeInsert(trigger.new);
  //}
  /* Before Update */
  if (trigger.isUpdate && trigger.isBefore) {
    handler.beforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
  /* Before Delete */
  //else if (trigger.isDelete && trigger.isBefore) {
  //  handler.beforeDelete(trigger.old, trigger.oldMap);
  //}
  /* After Insert */
  //else if (trigger.isInsert && trigger.isAfter) {
  //  handler.afterInsert(trigger.new, trigger.newMap);
  //}
  /* After Update */
  if (trigger.isUpdate && trigger.isAfter) {
    handler.afterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
  /* After Delete */
  //else if (trigger.isDelete && trigger.isAfter) {
  //  handler.afterDelete(trigger.old, trigger.oldMap);
  //}
  /* After Undelete */
  //else if (trigger.isUnDelete) {
  //  handler.afterUndelete(trigger.new);
  //}
}