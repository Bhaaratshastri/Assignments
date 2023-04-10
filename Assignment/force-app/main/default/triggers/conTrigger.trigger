/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger conTrigger on Contact (before insert) {
    ConTriggerHandler.updateContact(Trigger.new);
}