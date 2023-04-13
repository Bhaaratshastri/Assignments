/**
* Description: Use to fatch Contact other address in lead address
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger LeadTrigger on Lead (before insert) {
    LeadTriggerHandler.updateLead(Trigger.new);
}