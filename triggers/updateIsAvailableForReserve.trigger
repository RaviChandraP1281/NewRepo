/*
    @Author : Chetan Dawale
    @Description : This trigger updates IsAvailable flag of Employee_Study_Time object on updating the record of Employee_Study_Time  depending on lookup field
*/
trigger updateIsAvailableForReserve  on Employee_Study_Time__c (after update) {

  
     
    if (Trigger.isUpdate) {

        List < Employee_Study_Time__c > lstEmployee_Study_Time = new List < Employee_Study_Time__c > ();
        List < Employee_Study_Time__c > lstCancel = new List < Employee_Study_Time__c > ();
        Map < String, Boolean > updateValue = new Map < String, Boolean > ();
          Map < String, Boolean > updateValueemail = new Map < String, Boolean > ();

        for (Employee_Study_Time__c est: Trigger.new) {
            if (est.IsCanceled__c == true && est.IsAvailable__c == false) {
                lstCancel.add(new Employee_Study_Time__c(
                                Study_Time__c = est.Study_Time__c,
                                Employee_Name__c = '',
                                Employee_Email__c = '',
                                End_DateTime__c = est.End_DateTime__c,
                                End_Time__c = est.End_Time__c,
                                Start_DateTime__c = est.Start_DateTime__c,
                                Start_Time__c = est.Start_Time__c
                ));
            }
            updateValue.put(est.Study_Time__c, est.IsAvailable__c);
            updateValueemail.put(est.id, est.IsAvailable__c);
        }

        List < Employee_Study_Time__c > getReserveStatus = [Select  Id,
                                                                    IsAvailable__c, 
                                                                    IsCanceled__c, 
                                                                    Study_Time__c 
                                                            FROM    Employee_Study_Time__c 
                                                            WHERE   Study_Time__c IN: updateValue.keySet() 
                                                            AND     IsCanceled__c = : false];
       /* for (Employee_Study_Time__c obj: getReserveStatus) {
            if (obj.IsAvailable__c != updateValue.get(obj.Study_Time__c)) {
                obj.IsAvailable__c = updateValue.get(obj.Study_Time__c);
                lstEmployee_Study_Time.add(obj);
            }
        }*/
        
         if(!Test.isRunningTest()){
                SendingEmail.sendEmailToGarettUponEmployeeReservingOrCancling(updateValueemail);
            }

       // if (lstEmployee_Study_Time.size() > 0) {
           // update lstEmployee_Study_Time;
           
       // }

        if (lstCancel.size() > 0) {
            insert lstCancel;
        }
    }

}