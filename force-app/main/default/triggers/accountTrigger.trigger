/**
* Description: Use to fatch account billing address in contact other address
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger accountTrigger on Account (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountTriggerHandler.UpdateParantAccount(Trigger.new);
    }// End if
}