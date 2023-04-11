public with sharing class AccountTriggerHandler {
    public static void UpdateParantAccount(List<Account> acctList) {
        Set<String> ratings = new Set<String> ();
    	for (Account acct : acctList){
        	if (String.isNotBlank(acct.AccountId)){
            	ratings.add(acct.AccountId);
         	}// End if
    	}// End For
        List<Account> hotAccount: [SELECT Id, Name
                                FROM Account
                                WHERE Name = 'Master Hot'];
        for(Account acct : conList){
            for(Account hotAccts : hotAccount){
                if(acct.Rating == 'Hot' ){
                    acct.ParentId= hotAccts.Id;
                }// End if
            }// End for
        }// End for
    }
}