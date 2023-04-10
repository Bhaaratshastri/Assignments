/**
**/

trigger opptyTrigger1 on Opportunity (after insert) {
	if (Trigger.isInsert) {
        opptyTriggerHandler1.updateOppty(Trigger.new);
    }
    
}