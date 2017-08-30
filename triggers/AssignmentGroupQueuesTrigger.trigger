trigger AssignmentGroupQueuesTrigger on Assignment_Group_Queues__c (before insert, before update) {
    AssignmentGroupQueuesTriggerHandler.handle(trigger.new,trigger.oldMap,trigger.isUpdate);
}