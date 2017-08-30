trigger CreateArticleFeedback on FeedItem (after insert) {
if(Trigger.isAfter && Trigger.isInsert) {
    FeedbackTriggerHandler.onAfterInsert(Trigger.new);
  } 
}