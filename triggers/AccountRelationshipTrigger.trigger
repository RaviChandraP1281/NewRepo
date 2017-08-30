/*
	Trigger: AccountRelationshipTrigger
	Modified By: Jaya Alaparthi
	Modified Date: 2/3/2015
	Modified Purpose: Adding Account Stage Change BTBP-897 
	Modified Version: 1.1
*/
trigger AccountRelationshipTrigger on Account_Relationship__c (before insert, before update,after insert,after update) {
  //───────────────────────────────────────────────────────────────────────────┐
  // BEFORE INSERT
  //───────────────────────────────────────────────────────────────────────────┘
  if (trigger.isBefore && trigger.isInsert) {
    AccountRelationshipTriggerHandler.beforeInsertAction(trigger.new);
  }
  //───────────────────────────────────────────────────────────────────────────┐
  // AFTER INSERT
  //───────────────────────────────────────────────────────────────────────────┘
  if (trigger.isAfter && trigger.isInsert) {

    //─────────────────────────────────────────────────────────────────────────┐
    // Perform special handling if the User that inserted the records is one of
    // two special integration users (PDI or Data Migration).
    //─────────────────────────────────────────────────────────────────────────┘
    if (!UserInfo.getUserName().toLowerCase().contains('pdiuser') 
          && !UserInfo.getUserName().toLowerCase().contains('dmigr')) {
      SetRelatedAccoutOwner.setowner(new Map<Id,Account_Relationship__c>(trigger.new).Keyset());
    }

    //─────────────────────────────────────────────────────────────────────────┐
    // Execute the INSERT Action on the trigger handler.
    //─────────────────────────────────────────────────────────────────────────┘
    AccountRelationshipTriggerHandler.afterInsertAction(trigger.new,trigger.newMap);// 1.1
  }
  //───────────────────────────────────────────────────────────────────────────┐
  // BEFORE UPDATE
  //───────────────────────────────────────────────────────────────────────────┘
   if (trigger.isBefore && trigger.isUpdate) {
    AccountRelationshipTriggerHandler.beforeUpdateAction(trigger.new,trigger.oldMap);
  }
  //───────────────────────────────────────────────────────────────────────────┐
  // AFTER UPDATE (v1.1 additions)
  //───────────────────────────────────────────────────────────────────────────┘
  if(trigger.isAfter && trigger.isUpdate){
    AccountRelationshipTriggerHandler.afterUpdateAction(trigger.new,
                                                   trigger.newMap,
                                                   trigger.old,
                                                   trigger.oldmap);
  }
}