/**
* BTBS-5000: This trigger is used for updating custom phone field
* so phone field able to display on Activity list view
*
*  Name    : TaskTrigger
*  Author  : Ashutosh Tiwari
* 
*/

trigger TaskTrigger on Task (before Insert,before Update, after Insert, after Update) {

    TaskAndEventTriggerHelper taskTriggerHelper = new  TaskAndEventTriggerHelper();
     
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        system.debug('Task before Insert/Update');
        taskTriggerHelper.beforeInsertOrUpdate(Trigger.new);
    }
    
    //BTBE-718 Start : Code to invoke after insert/update trigger handler code for tasks.
    if(trigger.isBefore && (!trigger.isInsert || trigger.isUpdate)){
        taskTriggerHelper.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
  
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        taskTriggerHelper.afterInsertUpdate(Trigger.new, trigger.isInsert);
    }
    //BTBE-718 End Code Changes
            
 }