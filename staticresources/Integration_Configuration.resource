[
    {
        "order": 1,
        "sourceObjectName": "IntegrationAccount__c",
        "targetObjectName": "Account",
        "fieldMapping": {
            "Name": "Name",
            "Company_Id__c": "Company_ID__c",
            "Country__c": "Country__c",
            "Currency__c": "Currency__c",
            "Region__c": "Region__c"
        },
        "searchKey": "Company_Id__c"
    },
    {
        "order": 2,
        "sourceObjectName": "IntegrationContact__c",
        "targetObjectName": "Contact",
        "fieldMapping": {
            "Auth_Id__c": "Auth_Id__c",
            "Company_Id__c": "Company_ID__c",
            "Contact_Role__c": "Contact_Role__c",
            "Email__c": "Email",
            "First_Name__c": "FirstName",
            "Account__c": "AccountId",
            "Last_Name__c": "LastName",
            "Persona_Id__c": "Persona_ID__c",
            "Phone__c": "Phone"
        },
        "searchKey": "Company_Id__c"
    },
    {
        "order": 3,
        "sourceObjectName": "IntegrationAddress__c",
        "targetObjectName": "Address__c",
        "fieldMapping": {
            "Name": "Name",
            "City__c": "City__c",
            "Company_Id__c": "Company_ID__c",
            "Country__c": "Country__c",
            "Account__c": "Account__c",
            "Postal_Code__c": "Postal_Code__c",
            "State__c": "State__c"
        },
        "searchKey": "Company_Id__c"
    },
    {
        "order": 4,
        "sourceObjectName": "IntegrationAssets__c",
        "targetObjectName": "Asset",
        "fieldMapping": {
            "Name": "Name",
            "No_Of_Logins__c": "of_Logins__c",
            "Cancel_Date__c": "Cancel_Date__c",
            "Company_Id__c": "Company_Id__c",
            "Current_Product__c": "Current_Product__c",
            "First_Charge_Date__c": "First_Charge_Date__c",
            "Account__c": "AccountId",
            "Contact__c": "ContactId",
            "Last_Login_Date__c": "Last_Login_Date__c",
            "Next_Charge_Date__c": "Next_Charge_Date__c",
            "Original_Product__c": "Original_Product__c",
            "Payment_Setup_Date__c": "Payment_Setup_Date__c",
            "Plan_Name__c": "Plan_Name__c",
            "Product2__c": "Product2Id",
            "Signup_Date__c": "Signup_Date__c",
            "Suspend_Date__c": "Suspend_Date__c",
            "Trial_End_Date__c": "Trial_End_Date__c",
			"Asset_Name__c" : "Asset_Name__c",
			"OLB_Online_Banking__c" : "OLB_Online_Banking__c"
        },
        "searchKey": "Asset_Name__c",
        "relationshipKey": "Company_Id__c"
    }
]