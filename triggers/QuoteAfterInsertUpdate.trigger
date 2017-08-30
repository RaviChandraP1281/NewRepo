trigger QuoteAfterInsertUpdate on Quote (after insert, after update) {
    //OpportunitySyncQuoteIdUpdate.updateOpportunitySyncQuoteId(trigger.newMap.keySet()); //you can't call an async call from another async call - looking for solution
    /*Map <Id, Quote> quoteMap = new Map<Id, Quote>();
    
    for (Quote quote: trigger.new) {
        quoteMap.put(quote.OpportunityId, quote);
    }
    LIST<Opportunity> opps = [select Id, SyncedQuoteId from Opportunity where Id IN :quoteMap.keySet()];
    for (Opportunity opp: opps) {
        opp.SyncedQuoteId = quoteMap.get(opp.Id).Id;   
    }
    Database.update(opps);*/
}