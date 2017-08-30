/*
 *  Name    : ContactTrigger
 *  Author  : Nikhil Dandekar
 *  Comments: This trigger is a copy of the PrimaryFlagSetReset trigger .
              this trigger is rewritten to also handle bulk data upload . 
 *  Revision: 23-10-2013

* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.3	        Aditya Tiwari
* 2016-03-29    preventOnlineUpdate called in the ContactTrigger.BeforeUpdate method.
*               
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
 */
  trigger ContactTrigger on Contact (before insert,before update, after insert , after update ,after delete) {
     
      if (trigger.isBefore && trigger.isInsert ){
            ContactTriggerHelper.beforeInsert(trigger.new);       
      }
      if (trigger.isBefore && trigger.isUpdate){
          
          ContactTriggerHelper.beforeUpdate(trigger.new); 
          ContactTriggerHelper.preventOnlineUpdate(trigger.new,trigger.oldMap);
      }
      if(trigger.isAfter && trigger.isInsert){
          ContactTriggerHelper.afterInsertUpdate(trigger.new);
          ContactTriggerHelper.afterInsertMDMContacts(trigger.new);
      }
      if(trigger.isAfter && trigger.isUpdate){
          ContactTriggerHelper.afterInsertUpdate(trigger.new);
          ContactTriggerHelper.afterUpdateMDMContacts(trigger.new,trigger.oldMap);  
      }
      if(trigger.isAfter && trigger.isDelete){
          ContactTriggerHelper.afterDelete(trigger.old);
      }
      
	  if (trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
            ContactTriggerHelper.Phone_formatting(trigger.new);
      }      
      DefaultPreferenceUtils.getValues(Trigger.new, Trigger.old, Trigger.isBefore);
}