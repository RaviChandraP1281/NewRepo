trigger CaseTrigger on Case (before insert,before update, after insert , after update ,after delete) {

if(!UserInfo.getUserName().toLowerCase().contains('dmigr')){
    if(trigger.isAfter && trigger.isUpdate){
        CaseTriggerHelper.createClosecaseOpporunity(trigger.new);
        // Commented as Part of BTBC 1178 
        //CaseSurveyEmail.afterUpdate(trigger.new, trigger.oldmap);
        CaseTriggerHelper.afterUpdate(trigger.new);        
    }
    if(trigger.isAfter && trigger.isInsert){
        CaseTriggerHelper.createClosecaseOpporunity(trigger.new);
        // Commented as Part of BTBC 1178 
        //CaseSurveyEmail.afterUpdate(trigger.new, trigger.oldmap);
        CaseTriggerHelper.afterUpdate(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        CaseTriggerHelper.beforeUpdate(trigger.new, trigger.oldmap);
        CaseTriggerHelper.Asset2Product(trigger.new);
        //Create Study from Case (Added by DurgaPrasad A and Aditya N)
        CaseTriggerHelper.studioStudyCreation(trigger.new, trigger.oldMap);        
    }
    if(trigger.isBefore && trigger.isInsert){
        CaseTriggerHelper.InitiateCaseInactiveTimer(trigger.new);
        CaseTriggerHelper.beforeUpdate(trigger.new, trigger.oldmap);
        CaseTriggerHelper.Asset2Product(trigger.new);  
		//Added by Shruthi - to populated the Web related fields on Case
        CaseTriggerHelper.WebfieldsUpdate(trigger.new);
        //Get all cases created from Studio Portal (Added by DurgaPrasad A and Aditya N)
        CaseTriggerHelper.studioCaseOwnerUpdate(trigger.new);
 
    }
    //For investigation Counter
    if(trigger.isAfter &&  trigger.isUpdate){
       NewInvestigationTier2.updateInvReference(Trigger.New,Trigger.Old);
        
    }
    if(trigger.isAfter &&  trigger.isInsert){
        NewInvestigationTier2.updateInvReference(Trigger.New);
        
    }
// Coomented the lines Below to allow for better logical flow and structure of Trigger Execution.       
/*   if(trigger.isAfter && (trigger.isUpdate||trigger.isinsert)){
          CaseSurveyEmail.afterUpdate(trigger.new);
          CaseTriggerHelper.afterUpdate(trigger.new);
      }
    if(trigger.isBefore && trigger.isinsert)      {
                  CaseTriggerHelper.afterUpdate(trigger.new);
                    CaseTriggerHelper.InitiateCaseInactiveTimer(trigger.new);
        
    }     
      //set Substatus to Resolved
        if(trigger.isBefore && (trigger.isinsert || trigger.isUpdate)){
              CaseTriggerHelper.beforeUpdate(trigger.new);
        }
      
      if(trigger.isBefore && trigger.isUpdate){
          CaseTriggerHelper.Asset2Product(trigger.new);
      }
      
       if (trigger.isBefore && trigger.isInsert)
         {
          
          CaseTriggerHelper.Asset2Product(trigger.new);
         }
         
         
      //create opportunity for case Assisted sales & closed ones
      if(trigger.isAfter && (trigger.isUpdate || trigger.isinsert)){
        CaseTriggerHelper.createClosecaseOpporunity(trigger.new);
      }
 */     
 }
}