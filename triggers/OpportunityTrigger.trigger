trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
    if (trigger.isBefore && trigger.isInsert)
        OpportunityTriggerHandler.beforeInsert(trigger.new);
    else if (trigger.isAfter && trigger.isInsert)
        OpportunityTriggerHandler.afterInsert(trigger.new);  
    else if (trigger.isBefore && trigger.isUpdate)
    {
        OpportunityTriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);    
        Opportunity_tNPS_SurveyEmail.Update_Send_eMail_Flags(trigger.new);
    }
     else if (trigger.isAfter && trigger.isUpdate){
        OpportunityTriggerHandler.firstrunafterUpdate = false; 
        OpportunityTriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
        
    }

      
}