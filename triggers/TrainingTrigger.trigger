trigger TrainingTrigger on Training__c (before insert,before update, after insert , after update ,after delete) {
     if(trigger.isAfter && trigger.isUpdate){
        if(!UserInfo.getUserName().toLowerCase().contains('pdiuser') && !UserInfo.getUserName().toLowerCase().contains('dmigr'))
        CallAccountStageUpdate.PassAccountIds(trigger.new);
     }
     
     if(trigger.isAfter && trigger.isInsert){
        if(!UserInfo.getUserName().toLowerCase().contains('pdiuser') && !UserInfo.getUserName().toLowerCase().contains('dmigr'))
        CallAccountStageUpdate.PassAccountIds(trigger.new);
     }
}