/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Trigger FileExchangeTrigger 
* Trigger to set the Type for the File Exchnage 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       NVSS Chakradhar
* @modifiedby   NVSS Chakradhar
* @ownedby      NVSS Chakradhar
* @version      1.0
* @created      2016-07-14
* @modified     2016-08-30
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* Modified By   Shruthi S
* Version       1.1
* Modified Date 2016-08-30
* @Changes Made  - Converted the Trigger structure to a Helper Class. 
*                 Remove the Hard coded Role value
*                 No code logic change made. 
*_______________________________________________________________________________________________________
**/

trigger FileExchangeTrigger on FileExchange__c (before insert) {
    
     if (trigger.isBefore && trigger.isInsert ){
            FileExchangeTriggerHelper.beforeInsert(trigger.new);       
      }   
}