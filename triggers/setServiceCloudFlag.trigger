trigger setServiceCloudFlag on User (before insert, before update) {

/*
    Created / Modified By : Paddi Iyer
    Modified Date: 12/3/2012 by George Acker -- remove hard-coded roles and read from a custom setting instead
    Last Modifided Date: 12/11/2012 by Jaso Vaughan -- adding 
    Description : This trigger is used to populate ServiceCloudFlag on the user profile
    
*/

  List<Care_Cloud_Role_List__c> uRoles = Care_Cloud_Role_List__c.getall().values();
    for (User usr : Trigger.New) {
        for (Care_Cloud_Role_List__c uRole :uRoles)
        {
            if (uRole.name == usr.Role__c)
            {
                usr.UserPermissionsSupportUser = true;
                break;
            }
        }
        //Reactivates users if they were disabled by batch and are logging back in.
        if (UserDeactivationTriggerUtility.fireReactivationTrigger)
        {
            if (usr.Disabled_By_Batch__c) {
                usr.IsActive = true; 
                usr.Disabled_By_Batch__c = false;
            }
        }
    }
}