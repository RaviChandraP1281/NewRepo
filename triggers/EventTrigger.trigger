/**
* BTBS-5000: This trigger is used for updating custom phone field
* so phone field able to display on Activity list view
*
*  Name    : EventTrigger
*  Author  : Ashutosh Tiwari
* 
*/

trigger EventTrigger on Event (before Insert, before Update) {
        TaskAndEventTriggerHelper evntObj = new  TaskAndEventTriggerHelper();
     
    if(trigger.isBefore && (trigger.isInsert|| trigger.isUpdate)){
        system.debug('Event before Insert/Update');
        evntObj.beforeInsertOrUpdate(Trigger.new);
    }
       
}