/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the "Asset" object (API Name: Asset).
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
* @author       Naga Venkata Siva Syama Chakradhar Boddu
* @modifiedby   Vivek M. Chawla     <Vivek_Chawla@Intuit.com>
* @version      1.1
* @created      2014-04-06
* @modified     2014-10-20
* @systemlayer  Invocation
* @see          AssetTriggerHandler.class
* @see          Asset.object
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.1          Vivek_Chawla@Intuit.com
* 2014-10-20    Replaced old trigger body with the Intuit standard trigger action delegation
*               pattern.  Old trigger body was maintained, commented out, at the end of this file.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger AssetTrigger on Asset (before insert, before update, before delete, 
                               after insert,  after update,  after delete,  
                               after undelete) {
  //───────────────────────────────────────────────────────────────────────────┐
  // Instantiate the Trigger Handler, then dispatch to the correct Trigger 
  // Action Handler Method. Note that additional logic may be implemented in
  // Service classes outside of the Trigger Handler class.
  //───────────────────────────────────────────────────────────────────────────┘
  AssetTriggerHandler handler = new AssetTriggerHandler(trigger.size);

  /* Before Insert */
  //if (trigger.isInsert && trigger.isBefore) {
  //  handler.onBeforeInsert(trigger.new);
  //}
  /* Before Update */
  //else if (trigger.isUpdate && trigger.isBefore) {
  //  handler.onBeforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
  //}
  /* Before Delete */
  //else if (trigger.isDelete && trigger.isBefore) {
  //  handler.onBeforeDelete(trigger.old, trigger.oldMap);
  //}
  /* After Insert */
  if (trigger.isInsert && trigger.isAfter) {
    handler.onAfterInsert(trigger.new, trigger.newMap);
  }
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




//─────────────────────────────────────────────────────────────────────────────────────────────────┐
// OLD CODE BELOW!
// NOTE: On 2014-10-20, this trigger file was modified to follow the Apex Development best practice
// of keeping all business logic inside of a Trigger Handler class.
// 
// The old trigger code had several lines commented out.  It appears that Nikhil Dandekar was the 
// last person to update this code on 2014-07-10 at 4:29AM PDT.
//
// This code has been left in place until Vivek can connect with Nikhil, or other appropriate IDC 
// resources to see if the commented out code can be safely deleted.
//
// IMPORTANT! If the commented-out code needs to be re-enabled, it MUST be added to the 
// AssetTriggerHandler.cls file, and MUST NOT be re-enabled here, in this .trigger file.
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
//
//trigger AssetTrigger on Asset (after insert,after update) {
//    /*if(trigger.isAfter && trigger.isInsert){
//        if(!UserInfo.getUserName().toLowerCase().contains('pdiuser') && !UserInfo.getUserName().toLowerCase().contains('dmigr'))
//        CallAccountStageUpdate.PassAccountIds(trigger.new);
//     }
//    if(trigger.isAfter && trigger.isUpdate){
//        if(!UserInfo.getUserName().toLowerCase().contains('pdiuser') && !UserInfo.getUserName().toLowerCase().contains('dmigr'))
//        CallAccountStageUpdate.PassAccountIds(trigger.new);
//     }
//    */
//    //Update Opportunity to CLosed Won when Asset Status changes to 'Active/Subscribed' from  'In Trial'
//    if(trigger.isAfter && trigger.isUpdate){
//        IntegrationAssetOpportunityHelper.updateAssetOpportunity(trigger.newMap,trigger.oldMap);
//     }   
//}