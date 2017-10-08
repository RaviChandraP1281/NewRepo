public with sharing class ARVaultController {

    @AuraEnabled
    public static List<Object1__c> getActivities(){
        return [SELECT ActivityId__c, Name, ActivityDate__c 
                FROM Object1__c];

    }
    
    @AuraEnabled
    public static Object1__c getActivity(String Id){
        return [SELECT ActivityId__c, Name, ActivityDate__c 
                FROM Object1__c WHERE ActivityId__c = :Id];

    }
}