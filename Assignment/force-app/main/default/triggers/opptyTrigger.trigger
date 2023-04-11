/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger opptyTrigger on Opportunity (before insert, before delete) {
    if (Trigger.isInsert) {
        opptyTriggerHandler.ownershipPrivate(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualrevOpptyStage(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualRevenue(Trigger.new);
    }// End if

    if (Trigger.isDelete) {
        opptyTriggerHandler.deleteOppty(Trigger.old);
    }// End if
}