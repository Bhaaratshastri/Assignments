/**
* Description: Trigger use to Apply logic on Opportunity Fields
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger opptyTrigger on Opportunity (before insert, after insert, before delete) {
    if (Trigger.isBefore && Trigger.isInsert) {
        opptyTriggerHandler.ownershipPrivate(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualrevOpptyStage(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualRevenue(Trigger.new);
    }// End if

    if (Trigger.isAfter && Trigger.isInsert) {
        opptyTriggerHandler.updateOppty(Trigger.new);
    }// End if

    if (Trigger.isDelete) {
        opptyTriggerHandler.deleteOppty(Trigger.old);
    }// End if
}