trigger ErrorTrigger on Error__c (before insert) {
	if(Trigger.isBefore && Trigger.isInsert) {
		List<Error__c> errorList = new List<Error__c>();
		
		for(Error__c error : Trigger.new) {
			if(error.Error_Code__c != null && !error.Error_Code__c.startsWith('SFDC_')) {
				errorList.add(error);
			}
		}
		if(!UserInfo.getUserName().toLowerCase().contains('dmigr'))//dmigr
		ErrorTriggerHandler.beforeInsert(errorList);
	}
}