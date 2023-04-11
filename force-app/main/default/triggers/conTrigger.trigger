/**
* Description: Use to fatch account billing address in contact other address
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger conTrigger on Contact (before insert) {
    ConTriggerHandler.updateContact(Trigger.new);
}