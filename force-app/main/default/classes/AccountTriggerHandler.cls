/**
* Description: use to make Account trigger logic less
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
public with sharing class AccountTriggerHandler {
    // Assign Master Hot Account
    public static void updateParantAccountHot(List<Account> acctList) {
        Set<String> ratings = new Set<String> ();
    	for (Account acct : acctList){
        	if (String.isNotBlank(acct.Rating)){
            	ratings.add(acct.Rating);
         	}// End if
    	}// End For
        List<Account> hotAccount = new List<Account>();
        hotAccount = [SELECT Id, Name 
                    FROM Account 
                    WHERE Name = 'Master Hot'];
        for(Account acct : acctList){
            for(Account hotAcct : hotAccount){
                if(acct.Rating == 'Hot' ){
                    acct.ParentId= hotAcct.Id;
                }// End if
            }// End for
        }// End for
    }
    // Assign Master Cold Account
    public static void updateParantAccountCold(List<Account> acctList) {
        Set<String> ratings = new Set<String> ();
    	for (Account acct : acctList){
        	if (String.isNotBlank(acct.Rating)){
            	ratings.add(acct.Rating);
         	}// End if
    	}// End For
        List<Account> coldAccount = new List<Account>();
        coldAccount = [SELECT Id, Name 
                    FROM Account 
                    WHERE Name = 'Master Cold'];
        for(Account acct : acctList){
            for(Account coldAcct : coldAccount){
                if(acct.Rating == 'Cold' ){
                    acct.ParentId= coldAcct.Id;
                }// End if
            }// End for
        }// End for
    }
    // Assign Master Warm Account
    public static void updateParantAccountWarm(List<Account> acctList) {
        Set<String> ratings = new Set<String> ();
    	for (Account acct : acctList){
        	if (String.isNotBlank(acct.Rating)){
            	ratings.add(acct.Rating);
         	}// End if
    	}// End For
        List<Account> warmAccount = new List<Account>();
        warmAccount = [SELECT Id, Name 
                    FROM Account 
                    WHERE Name = 'Master Warm'];
        for(Account acct : acctList){
            for(Account warmAcct : warmAccount){
                if(acct.Rating == 'Warm' ){
                    acct.ParentId= warmAcct.Id;
                }// End if
            }// End for
        }// End for
    }
}