/*
    @author = George Acker
    Trigger on contact that verifies emails are unique within specific record types.
    Flow is as follows:
        1) Find record types we care about
        2) Loop through trigger records to find the emails we need to query on
        3) Parse the query results into a map that holds recordtypeid + email as a key, pointing to id
        4) Loop through trigger records and check if the recordtypeid + email combination exists in the map.
            a) if yes, throw an error on that record
            b) if no, that record is valid
*/
trigger ContactUniqueEmail on Contact (before insert, before update) {
   /* Profile[] userProf = [select name from Profile where id = :UserInfo.getProfileId()];
    boolean circumvent = false;
    if (userProf.size() > 0)
    {
        for (Circumvent_Unique_Email__c c :Circumvent_Unique_Email__c.getall().values())
        {
            if (userProf[0].name == c.profile_name__c)
            {
                circumvent = true;
                break;
            }
        }
    }
    
    if (!circumvent)
    {
        string[] emails = new string[]{};
        //get the record types we care about
        RecordType[] recTypes = [select id from RecordType where SobjectType = 'Contact' and DeveloperName in ('Business_Contact')];
        for (Contact c :trigger.new)
        {
            if (c.email != null && c.email.length() > 0 && (!trigger.isUpdate || c.email != trigger.oldMap.get(c.Id).email))
                emails.add(c.email); //add all emails that are not null and have changed in value
        }
        //get all contacts that have matching emails within recordtypes
        Contact[] contactEmails = [select email,recordtypeid from contact where email in :emails and recordtypeid in :recTypes];
        Utility_MapChain chain = new Utility_MapChain();
        for (Contact c :contactEmails)
        {
            //create a map of recordtype + email so that we can check against it later
            chain.putData(new object[] {c.recordtypeid,c.email},c.id);
        }
        
        //now check all the trigger items to see if the recordtype + email already exists
        for (contact c :trigger.new)
        {
            object o = chain.getData(new object[]{c.recordtypeid,c.email});
            if (o != null && (id) o != c.id){
                c.addError('Email already exists on another contact (' + (id) o + ')');
            }
            // Quick code addition to handle phone format
            // Copy Phone number to Phone_Search_Format__c for search index (strip phone format)
            if (c.Phone != null){
                String ph = c.Phone;
                c.Phone_Search_Format__c = ph.remove('(').remove(')').remove('-').remove(' ');
            }
        }
    }*/
}