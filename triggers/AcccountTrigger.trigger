/*
* Modified By: Jaya Alaparthi
* modified purpose: adding logic for account stage automation
* modified Date: 2/2/2015
* modifed version: 1.1 BTBP-897
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.2	        Jaya Alaparthi
* 2015-06-10    afterUpdateMDMAccounts Can be called in the AccountTriggerHelper.afterUpdate method.
*               
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘ 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.3	        Aditya Tiwari
* 2016-03-29    preventOnlineUpdate called in the AccountTrigger.BeforeUpdate method.
*               
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘ 
*/
trigger AcccountTrigger on Account (before insert,before update, after insert , after update ,after delete) {
    if(trigger.isAfter && trigger.isUpdate){
       /*	v1.2
        AccountTriggerHelper.afterUpdateMDMAccounts(trigger.new,trigger.oldMap);
       */ 
        /* version 1.1 addition*/
        AccountTriggerHelper.afterUpdate(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap); 
    } else if (Trigger.isBefore && Trigger.isUpdate) {
        AccountTriggerHelper.beforeUpdate(Trigger.new);
        AccountTriggerHelper.preventOnlineUpdate(trigger.new,trigger.oldMap);

    }
    
    // version 1.1 addition
    if(trigger.isAfter && trigger.isInsert){
    	AccountTriggerHelper.afterInsert(Trigger.new,Trigger.newMap);
    }
    /* Always Execuites */
    DefaultPreferenceUtils.getValues(Trigger.new, Trigger.old, Trigger.isBefore);
}