trigger OpportunityLineItemTrigger on OpportunityLineItem(before insert,after insert,before update, after update, before delete, after delete, after undelete) {
    OpportunityLineItemHandler handler = new OpportunityLineItemHandler(true);
    
    /*Before Insert*/
    if(Trigger.isInsert && Trigger.isBefore){
        handler.OnBeforeInsert(Trigger.New);
    }
    /*After Insert*/
    else if(Trigger.isInsert && Trigger.isAfter){
        handler.onAfterInsert(Trigger.New);
    }
    /*Before update*/
    else if(Trigger.isUpdate && Trigger.isBefore){
        handler.onBeforeUpdate(Trigger.Old, Trigger.New, Trigger.NewMap, Trigger.OldMap);
    }
    /*After update*/
    else if(Trigger.isUpdate && Trigger.isAfter){
        handler.onAfterUpdate(Trigger.Old, Trigger.New, Trigger.NewMap, Trigger.OldMap);
    }
    /*Before Delete*/
    else if(Trigger.IsDelete && Trigger.isBefore){
        handler.onBeforeDelete(Trigger.Old, Trigger.OldMap);
    }
    /*After Delete*/
    else if (Trigger.isDelete && Trigger.isAfter){
        handler.onAfterDelete(Trigger.Old, Trigger.OldMap);
    }
    /*After Undelete*/
    else if (Trigger.isUndelete){
        handler.OnUndelete(Trigger.New);
    }

}