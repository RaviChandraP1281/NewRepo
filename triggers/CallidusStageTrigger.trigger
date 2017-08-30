/**
* -------------------------------------------------------------------------------------------------+
* Master trigger for the "Callidus Stage " object (API Name: CallidusStage__c).
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
* --------------------------------------------------------------------------------------------------
* @author       Aditya Nagulapalli <Aditya_Nagulapalli@Intuit.com>
* @modifiedby    
* @version      1.0
* @created      2015-12-07
* @modified     
* @systemlayer  Invocation
* @see          CallidusStageTriggerHandler.class
* @see          CallidusStage__c.object
* -------------------------------------------------------------------------------------------------+
*/
trigger CallidusStageTrigger on CallidusStage__c (before insert,after insert ,after update ) {
//---------------------------------------------------------------------------+
  // Instantiate the Trigger Handler, then dispatch to the correct Trigger 
  // Action Handler Method. Note that additional logic may be implemented in
  // Service classes outside of the Trigger Handler class.
  //---------------------------------------------------------------------------+
  CallidusStageTriggerHandler handler = new CallidusStageTriggerHandler(trigger.size);
  
  
  /* After Insert */
  if (trigger.isInsert && trigger.isAfter) {
    
    handler.onAfterInsert(trigger.new);
  }
  /* After Update */
  else if (trigger.isUpdate && trigger.isAfter) {
      for (CallidusStage__c rec : trigger.new){
          if (trigger.oldMap.get(rec.Id).EventType__c != trigger.newMap.get(rec.Id).EventType__c)
              handler.onAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
      } 
    
  }

}