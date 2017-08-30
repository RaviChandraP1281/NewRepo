trigger Rackspace_DocumentTrigger on Rackspace_Document__c (after insert) {
	 if(Trigger.isAfter){
        if(Trigger.isInsert){
            Rackspace_DocumentTriggerHandler.updateCaseStatusForUploadedDocs(JSON.serialize(Trigger.new));
        }
    }    
}