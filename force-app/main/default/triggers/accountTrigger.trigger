/**
* Description: This trigger Use to assign a parent account based on there rating
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger accountTrigger on Account (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountTriggerHandler.updateParantAccount(Trigger.new);
        
    }// End if
}