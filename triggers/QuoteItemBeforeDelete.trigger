trigger QuoteItemBeforeDelete on QuoteLineItem (before delete) {


for (QuoteLineItem ql: trigger.old)
 if (ql.Quote_IsLocked__c == 'True') {
  ql.addError('Once the Quote Status = Accepted, the quote is Locked, Quote lines cannot be deleted.');
 }
}