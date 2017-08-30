trigger SurveyEmail on Case (after update) {

/*
    Created / Modified By : Bharath
    Modified Date: 
    Last Modified Date: 
    Description : This trigger is used to set and unset the flags in the User Object for the tNPS Survey using Click Tools
    

for(Case SurveyforCase  : Trigger.New)
  {   
    if(SurveyforCase.IsClosed == true) 
    {
    List<User> userList = [Select Id,nps_Last_emailsent__c from User where id =: SurveyforCase.OwnerId ];   
       if(userList[0].nps_Last_emailsent__c == null||userList[0].nps_Last_emailsent__c   <=System.Today() - Integer.valueOf(Label.NPS_Survey_Frequency_in_Days) )
        {
            userList[0].nps_Last_emailsent__c = System.Today();
            userList[0].Send_Email__c = true;
           
        }
        else
        {
                      userList[0].Send_Email__c = false;
                      
        }
                 update userList;
  List<Contact> ContactDetails = [Select Id,VOC_Last_emailsent__c from Contact where id =: SurveyforCase.ContactId ];
  if(ContactDetails[0].VOC_Last_emailsent__c == null||ContactDetails[0].VOC_Last_emailsent__c<=System.Today() - Integer.valueOf(Label.VOC_Survey_Frequency_in_Days))
  {            
            ContactDetails[0].VOC_Last_emailsent__c = System.Today();
            ContactDetails[0].Send_Email__c = true;
  }
     else
        {
                      ContactDetails[0].Send_Email__c = false;
                      
        }
                 update ContactDetails;
     
     
         
     }        
    }
    */
    
}