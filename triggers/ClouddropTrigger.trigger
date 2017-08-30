trigger ClouddropTrigger on Cloudrop__Cloud_Storage__c (after insert, before insert, before update) {

    if (trigger.isAfter && trigger.isInsert){
        ClouddropTriggerHandler.afterInsert(Trigger.new);
    }

	if(trigger.isInsert && trigger.isBefore)
	{
        ClouddropTriggerHandler.beforeInsert(Trigger.new);
    }
   
    if(trigger.isUpdate && trigger.isBefore){
        ClouddropTriggerHandler.beforeUpdate(Trigger.new);
        
    }
}