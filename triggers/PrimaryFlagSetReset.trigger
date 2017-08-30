/*
 *  Name    : PrimaryFlagSetReset
 *  Author  : Nikhil Dandekar
 *  Comments: This trigger is a copy of the PrimaryFlagSetReset trigger .
              this trigger is rewritten to also handle bulk data upload . 
 *  Revision: 23-10-2013
 */

  trigger PrimaryFlagSetReset on Contact (before insert,before update, after insert , after update ,after delete) {
      
      if (trigger.isBefore && trigger.isInsert ){
            ContactTriggerHelper.beforeInsert(trigger.new);        
      }
      if (trigger.isBefore && trigger.isUpdate){
          ContactTriggerHelper.beforeUpdate(trigger.new); 
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
      
      
   
}