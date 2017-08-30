/*
 *  Name    : Gen2->3MigrationTrigger
 *  Author  : NVSS Chakradhar
 *  Comments: Trigger contains code get seed data for the main process
 */

trigger Gen3Trigger on Gen3__c(before insert) {
	try {
		Set < String > companyIdSet = new Set < String > (); //R1+R2+R3

		Map < String, Account > companyMap = new Map < String, Account > ();
       //*********************** 
        List<Asset> QBOWsToInsertUnderR3 = new List<Asset>(); //In case QBOW is missing under R3
        
        String qbowProductid = [Select ID from Product2 Where SKU__c = '107'].ID;
      //************************
		for (Gen3__c genRec: Trigger.new) {

			if (String.isNotBlank(genRec.R1__c)) {
				companyIdSet.add(genRec.R1__c.trim());
			}
			if (String.isNotBlank(genRec.R2__c)) {
				companyIdSet.add(genRec.R2__c.trim());
			}
			if (String.isNotBlank(genRec.R3__c)) {
				companyIdSet.add(genRec.R3__c.trim());
			}
		}

		for (Account acc: [Select ID, ParentID, Company_ID__c, 
                          (Select ID, Name,Signup_Date__c,Online_Offer_Code__c,Payment_Setup_Date__c from Assets Where Name like 'QBO-W-%')
		                  from Account Where Company_ID__c IN: companyIdSet]) {

			companyMap.put(acc.Company_ID__c, acc); //Map R1+R2+R3

		}
        /*
		   Get Parent and QBOW info of all companies (R1+R2+R3) 
		*/
		for (Gen3__c genRec: Trigger.new) {
            //**************
             String OfferID = NULL;
             Date PaymentSetupDate = NULL;
             Date SignupDate = NULL;
            //************
			if (String.isNotBlank(genRec.R1__c)) {

				genRec.R1ID__c = companyMap.get(genRec.R1__c) == NULL ? NULL : companyMap.get(genRec.R1__c).ID;
				genRec.RP1ID__c = companyMap.get(genRec.R1__c) == NULL ? NULL : companyMap.get(genRec.R1__c).ParentID;

				if (companyMap.get(genRec.R1__c) != NULL) 
				  if (companyMap.get(genRec.R1__c).Assets != NULL) 
                    if (companyMap.get(genRec.R1__c).Assets.size() > 0){ 
					     genRec.R1QBOWID__c = companyMap.get(genRec.R1__c).Assets[0].ID; //Setting QBOW for R1
                         OfferID = companyMap.get(genRec.R1__c).Assets[0].Online_Offer_Code__c;
                         PaymentSetupDate = companyMap.get(genRec.R1__c).Assets[0].Payment_Setup_Date__c;
                         SignupDate = companyMap.get(genRec.R1__c).Assets[0].Signup_Date__c;
                        
                    }


			}

			if (String.isNotBlank(genRec.R2__c)) {
				genRec.R2ID__c = companyMap.get(genRec.R2__c) == NULL ? NULL : companyMap.get(genRec.R2__c).ID;
				genRec.RP2ID__c = companyMap.get(genRec.R2__c) == NULL ? NULL : companyMap.get(genRec.R2__c).ParentID;

				if (companyMap.get(genRec.R2__c) != NULL) 
				   if (companyMap.get(genRec.R2__c).Assets != NULL) 
                    if (companyMap.get(genRec.R2__c).Assets.size() > 0) {
					    genRec.R2QBOWID__c = companyMap.get(genRec.R2__c).Assets[0].ID;
                        OfferID = companyMap.get(genRec.R2__c).Assets[0].Online_Offer_Code__c;
                        PaymentSetupDate = companyMap.get(genRec.R2__c).Assets[0].Payment_Setup_Date__c;
                        SignupDate = companyMap.get(genRec.R2__c).Assets[0].Signup_Date__c;
                        
                    }

			}

			if (String.isNotBlank(genRec.R3__c)) {

				genRec.R3ID__c = companyMap.get(genRec.R3__c) == NULL ? NULL : companyMap.get(genRec.R3__c).ID;
				genRec.RP3ID__c = companyMap.get(genRec.R3__c) == NULL ? NULL : companyMap.get(genRec.R3__c).ParentID;

				if (companyMap.get(genRec.R3__c) != NULL) 
				  if (companyMap.get(genRec.R3__c).Assets != NULL)
     				  if (companyMap.get(genRec.R3__c).Assets.size() > 0) 
					       genRec.R3QBOWID__c = companyMap.get(genRec.R3__c).Assets[0].ID;

			}
            //***********************************************************
            //Insert QBOWs
            
            if(genRec.R3QBOWID__c == NULL){
                
                QBOWsToInsertUnderR3.add(new Asset(Name = 'QBO-W-' + genRec.R3__c ,
				Asset_Name__c = 'QBO-W-' + genRec.R3__c ,
                Online_Offer_Code__c = OfferID,
                Payment_Setup_Date__c =  PaymentSetupDate,
                Signup_Date__c  = SignupDate,                                   
				Company_Id__c = genRec.R3__c,
				AccountId = (ID) genRec.R3ID__c,
				Current_Product__c = qbowProductid,
				Original_Product__c = qbowProductid));
                
            }
            //************************************************************
			if (genRec.R3__c == NULL) {
				genRec.Error_Message__c = 'R3 Company is missing in excel.';
				genRec.Error__c = true;

			} else if (genRec.R3__c != NULL && genRec.R3ID__c == NULL) {
				genRec.Error_Message__c = 'R3 Company is missing in salesforce.';
				genRec.Error__c = true;
			} else if (genRec.R1__c == NULL && genRec.R2__c == NULL) {
				genRec.Error_Message__c = 'R1 ,R2 Companies are missing in excel.';
				genRec.Error__c = true;
			} else if (genRec.R1ID__c == NULL && genRec.R2ID__c == NULL) {
				genRec.Error_Message__c = 'R1 ,R2 Companies are missing in salesforce.';
				genRec.Error__c = true;
			}
            
          
		}
     //*********************************************************  
        if(QBOWsToInsertUnderR3.size()>0){
            Database.insert(QBOWsToInsertUnderR3,false);
        }
        
       Map<String,ID> R3QBOWCompanyIdIDMap = new  Map<String,ID>();
           
        for(Asset rec:QBOWsToInsertUnderR3){
           R3QBOWCompanyIdIDMap.put(rec.Company_Id__c,rec.Id);            
        }

        for (Gen3__c genRec: Trigger.new){
           if(genRec.R3QBOWID__c == NULL)
              genRec.R3QBOWID__c = R3QBOWCompanyIdIDMap.get(genRec.R3__c);
        }
   //***************************************************************     
	} catch (Exception ex) {
		Insert new Error__c(Error_Description__c = ex.getMessage()+'###'+'Class: Gen3Trigger'+'######'+'Stack Trace:' + ex.getStackTraceString()+
                            '###'+'Gen3Trigger###',Error_Code__c = 'Batch Apex-GEN23Migration');
	}
}