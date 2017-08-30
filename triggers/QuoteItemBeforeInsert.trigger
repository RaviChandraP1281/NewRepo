trigger QuoteItemBeforeInsert on QuoteLineItem (before insert, before update) {
    /*
    MAP<String, MAP<String, PricebookEntry>> PBEMap = new MAP<String, MAP<String, PricebookEntry>>();
    MAP<String, PriceBook2> PBMap = new MAP<String, PriceBook2>();
    
    if (trigger.isInsert) {
        for (PriceBook2 pb: [select Id, Name from PriceBook2]) {
            PBMap.put(pb.Id, pb);   
        }
        for (PriceBookEntry pbe: [select Id, ProductCode, Pricebook2Id from PriceBookEntry where ProductCode != null]) {
            if (!PBEMap.containsKey(PBMap.get(pbe.Pricebook2Id).Name)) {
                PBEMap.put(PBMap.get(pbe.Pricebook2Id).Name, new MAP<String, PriceBookEntry>());
                PBEMap.get(PBMap.get(pbe.Pricebook2Id).Name).put(pbe.ProductCode, pbe);
            }
            else { 
                PBEMap.get(PBMap.get(pbe.Pricebook2Id).Name).put(pbe.ProductCode, pbe);
            }
        }
        system.debug('@@PBEMap: ' + PBEMap);
        
        for (QuoteLineItem ql: trigger.new) {           
            if (PBEMap != null && PBEMap.containsKey(ql.Siebel_Price_Book_Name__c)) {    
                if (PBEMap.get(ql.Siebel_Price_Book_Name__c).containsKey(ql.Siebel_Product_Code__c)) {
                    ql.PriceBookEntryId = PBEMap.get(ql.Siebel_Price_Book_Name__c).get(ql.Siebel_Product_Code__c).Id;
                }
            }
        }
        
    } */
}