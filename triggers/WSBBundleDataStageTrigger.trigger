/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Trigger code on WSBBundleDataStage__c Object
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       Amit Sachan   <amit_sachan@Intuit.com>
* @modifiedby   Amit Sachan   <amit_sachan@Intuit.com>
* @ownedby      Amit Sachan   <amit_sachan@Intuit.com>
* @version      1.0
* @created      2017-05-08
* @modified     2017-05-08
* @systemlayer  Trigger
* @see          
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0          amit_sachan@intuit.com
* 2017-05-08    Initial implementation.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/


trigger WSBBundleDataStageTrigger on WSBBundleDataStage__c (before insert) {
 //Instaniating Helper class
 WSBBundleDataStageTriggerHandler handler = new WSBBundleDataStageTriggerHandler(trigger.size);
 
 // Before Insert trigger condition
 if (trigger.isInsert && trigger.isBefore) {
    
    handler.onBeforeInsert(trigger.new);
  }
 
}