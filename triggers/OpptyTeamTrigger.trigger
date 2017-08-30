trigger OpptyTeamTrigger on OpportunityTeamMember (before insert, before update, after insert) {
    if (trigger.isBefore && trigger.isInsert)
        OpptyTeamTriggerHandler.beforeInsert(trigger.new);
    else if (trigger.isBefore && trigger.isUpdate)
        OpptyTeamTriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);
    else if (trigger.isAfter && trigger.isInsert)
        OpptyTeamTriggerHandler.afterInsert(trigger.new);
}