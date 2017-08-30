/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Master trigger for the "QuoteLineItems" object (API Name: QuoteLineItem).
*
* This trigger provides dispatch logic for the following Trigger Actions:
*
*   Before Delete
*   All other actions
*
* The framework for dispatching additional Trigger Actions has been left in place.  To activate 
* these additional dispatch calls, un-comment the appropriate lines of code.  Before doing so, 
* make sure that the corresponding method in the handler class has been implemented.
*
* IMPORTANT!  Under no circumstance should additional logic be placed here, within this Trigger 
* definition.  Trigger logic should ONLY be implemented by the Trigger Handler class, or classes
* called by the Trigger Handler class.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author       --
* @modifiedby   Deep Diwakar <deep_diwakar@intuit.com>
* @version      1.2
* @created      --
* @modified     11-MAY-2015
* @systemlayer  Invocation
* @see          QuoteLineItemTriggerHandler.class
* @see          QuoteLineItem.object
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.1          Deep Diwakar
* 2014-10-20    Replaced old trigger body with the Intuit standard trigger action delegation
*               pattern.  Old trigger body was maintained, commented out, at the end of this file.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
* @changes
* v1.2          Deep Diwakar
* 2014-10-20    Removed extra trigger 'beforeInsert' and merged into this one, so now there is only
                one trigger for QuoteLineItem object
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
trigger QuoteLineTrigger on QuoteLineItem (before insert, after insert, before delete, 
                                 after update) {
                               	
                               	//Trigger action before delete
                               	if (trigger.isBefore && trigger.isDelete)
                               	    QuoteLineItemTriggerHandler.beforeDelete(trigger.new, trigger.old);
                               	    
                               	//Excute this block for all other trigger actions    
                               	else
                                    QuoteLineItemTriggerHandler.handler(trigger.new,trigger.oldMap);
   
}
//OLD CODE BELOW
//trigger QuoteLineTrigger on QuoteLineItem (before insert, after insert, after update, before delete) {
    //if (trigger.isBefore && trigger.isDelete)
       // QuoteLineItemTriggerHandler.beforeDelete(trigger.new, trigger.old);
   // else
       // QuoteLineItemTriggerHandler.handler(trigger.new,trigger.oldMap);
//}