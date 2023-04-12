/**
* Description: use to make Account trigger logic less
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
public with sharing class AccountTriggerHandler {
    // Assign Master Account
    public static void updateParantAccount(List<Account> acctList) {
        Map<String, Account> mapRating = new Map<String, Account>();
        for (Account acct: [SELECT Id, Name, Rating 
                            FROM Account 
                            WHERE Name IN  ('Master Hot', 'Master Cold', 'Master Warm')]) {  
             mapRating.put(acct.Rating, acct);
        }
        for(Account acct : acctList){
            if (mapRating.Containskey(acct.Rating)) {
                acct.ParentId = mapRating.get(acct.Rating).Id;
            }
        }// End for
    }
    /*public static void updateContactField(List<Account> acctList) {
        for(Account acct : acctList){
        List<Contact> con = new List<Contact>();
        con = [SELECT Id, AccountId
            FROM Contact
            WHERE AccountId IN acct.Id]
        }
    }*/
}