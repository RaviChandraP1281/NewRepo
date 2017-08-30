trigger StudyCaseCreation on Study__c (before insert) {
    
    if(trigger.isInsert){
        Map<Integer,Study__c>studyCaseObjList = new Map<Integer,Study__c>();
        List<Case> caseValues = new List<Case>();
        Integer i = 0;
        for(Study__c studyObj : Trigger.new){
            if(studyObj.Request_Type__c == 'Office Hours'){
                Case caseObj = new Case();
                if(studyObj.Study_Number_of_Participants__c != null){
                    caseObj.Study_Number_of_Participants__c  = String.valueOf(studyObj.Study_Number_of_Participants__c);
                }
                caseObj.Study_CDG__c = studyObj.Study_CDG__c;
                caseObj.Study_Contact_Location__c = studyObj.Contact_Location__c;
                caseObj.Study_Customer_Benefits__c = studyObj.Customer_Benefits__c;
                caseObj.Strategic_Priority_Aligned__c = studyObj.Strategic_Priority_Aligned__c;
                
                caseObj.Study_Email__c = studyObj.Email__c;
                caseObj.Study_First_Name__c = studyObj.First_Name__c;
                caseObj.Study_Goals__c = studyObj.Goals_Learning__c;
                caseObj.Study_IC_Facilitator_for_RP__c = studyObj.IC_Facilitator_for_RP__c;
                caseObj.Study_Last_Name__c = studyObj.Last_Name__c;
                
                caseObj.Study_Location_of_Study__c = studyObj.Location_Of_Study__c;
                caseObj.Study_Participant_Attributes__c = studyObj.Participant_Attributes__c;
                caseObj.Study_Person_to_Charge_Compensation_to__c = studyObj.Person_to_Charge_Compensation__c;
                caseObj.Study_Phone__c = studyObj.Phone__c;
                caseObj.Study_Products__c = studyObj.Product__c;
                caseObj.Request_Type__c = studyObj.Request_Type__c;
                
                caseObj.Study_Types__c = studyObj.Study_Type__c;
                caseObj.Study_Name__c = studyObj.name;            
                caseObj.Studio_Recruiter__c = studyObj.Recruiter__c;
                caseObj.Study_Customer_Segment__c = studyObj.Customer_Segment__c;
                
                caseObj.Study_Start_Date__c = studyObj.Start_Date_of_Study__c;
                caseObj.Study_End_Date__c = studyObj.End_Date_of_Study__c;
                
                caseObj.Study_Company__c = studyObj.Study_Company__c;
                caseObj.Study_Group__c = studyObj.Study_Group__c;
                caseObj.Study_Department__c = studyObj.Study_Department__c; 
                
                caseObj.Country_of_Study__c = studyObj.Country_of_Study__c;
                caseObj.Hiring_Manager__c = studyObj.Person_conducting_study__c;
                caseObj.Study_Notes__c = studyObj.Notes__c;
                
                studyCaseObjList.put(i,studyObj);
                caseValues.add(caseObj);
                i++;
            }
        }
        if(studyCaseObjList.size() > 0){
            insert caseValues;
            for(i = 0;i < caseValues.size(); i++){
                studyCaseObjList.get(i).Related_Case__c  = caseValues[i].id;
            }
        }
    }


    
}