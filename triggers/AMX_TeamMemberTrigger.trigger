/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the AMX Team Member object.
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
*   Before Insert
*   Before Update
*   After  Insert
*   After  Update
*   Before Delete
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
* @author       Sunil Sharma
* @modifiedby   Sunil Sharma     <Sunil_Sharma3@Intuit.com>
* @version      0.1
* @created      Sunil Sharma
* @modified     None
* @see          AMXteamMemberHandler.class
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger AMX_TeamMemberTrigger on AMX_Team_Member__c (before insert, before update, before delete, 
				                                             after  delete, after  insert, after  update, 
				                                             after  undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Trigger 
  // Action Handler Method. Note that additional logic may be implemented in
  // Service classes outside of the Trigger Handler class.
  //───────────────────────────────────────────────────────────────────────────┘
  AMX_TeamMemberTriggerHandler handler = new AMX_TeamMemberTriggerHandler();
  /* Before Insert */
  if (trigger.isInsert && trigger.isBefore) {
    handler.beforeInsert(trigger.new);
  }
  /* Before Update */
  else if (trigger.isUpdate && trigger.isBefore) {
    handler.beforeUpdate(trigger.new, trigger.oldMap);
  }
  /* Before Delete */
  else if (trigger.isDelete && trigger.isBefore) {
    handler.beforeDelete(trigger.old, trigger.oldMap);
  }
  /* After Insert */
  else if (trigger.isInsert && trigger.isAfter) {      
    //handler.onAfterInsert(trigger.new, trigger.newMap);
  }
  /* After Update */
  else if (trigger.isUpdate && trigger.isAfter) {
    //handler.onAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  }
}