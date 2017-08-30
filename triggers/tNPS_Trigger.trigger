trigger tNPS_Trigger on tNPS_Survey_Response__c (before insert, before update, after insert, after update) {
    
    if (trigger.isbefore && trigger.isInsert)
        tNPS_Survey_Transformation.beforeInsert(trigger.new);  
    
}