trigger CampaignTrigger on Campaign (after insert, after update) {
    if (trigger.isAfter && trigger.isUpdate) {
        CampaignTriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
    } 
}