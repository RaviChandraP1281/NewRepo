trigger PayrollCommissionTrigger on PayrollCommission__c(before insert,after insert,before update, after update, before delete, after delete, after undelete) {
    /*PayrollCommissionTriggerHandler handler = new PayrollCommissionTriggerHandler(true);
    
    
    if(Trigger.isInsert && Trigger.isBefore){
        handler.OnBeforeInsert(Trigger.New);
    }
    
    else if(Trigger.isInsert && Trigger.isAfter){
        handler.onAfterInsert(Trigger.New);
    }
    
    else if(Trigger.isUpdate && Trigger.isBefore){
        handler.onBeforeUpdate(Trigger.Old, Trigger.New, Trigger.NewMap, Trigger.OldMap);
    }
    
    else if(Trigger.isUpdate && Trigger.isAfter){
        handler.onAfterUpdate(Trigger.Old, Trigger.New, Trigger.NewMap);
    }
    
    else if(Trigger.IsDelete && Trigger.isBefore){
        handler.onBeforeDelete(Trigger.Old, Trigger.OldMap);
    }
    
    else if (Trigger.isDelete && Trigger.isAfter){
        handler.onAfterDelete(Trigger.Old, Trigger.OldMap);
    }
    
    else if (Trigger.isUndelete){
        handler.OnUndelete(Trigger.New);
    }
*/
}