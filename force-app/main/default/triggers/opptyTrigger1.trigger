/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/

trigger opptyTrigger1 on Opportunity (after insert) {
	if (Trigger.isInsert) {
        opptyTriggerHandler1.updateOppty(Trigger.new);
    }// End if
    
}