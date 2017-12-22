public with sharing class Lookupcontroller {
	public Lookupcontroller() {

	}
	@AuraEnabled
	public static List<sObject> querySalesforceRecord(String queryString) {
		return Database.query(queryString);
	}
    @auraEnabled
    public static List<Account> getAccounts(String accountname){

        String fnd = accountname + '%';

        return [ select name FROM Account where name like:fnd];
    }
}