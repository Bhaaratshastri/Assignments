public class ConTriggerHandler {
	public static void updateContact(List<Contact> conList){
        Set<String> accountIds = new Set<String> ();
    	for (Contact con : conList){
        	if (String.isNotBlank(con.AccountId)){
            	accountIds.add(con.AccountId);
        	}// End if
    	}// End for
    	List<Account> acct = [SELECT Id, BillingStreet,BillingCity, BillingState, BillingPostalCode, BillingCountry FROM Account];
    	for(contact con : conList){
        	for(Account accts : acct){
            	if(con.AccountId ==  accts.Id){
                    	con.OtherStreet = accts.BillingStreet;
                    	con.OtherCity = accts.BillingCity;
                    	con.OtherState = accts.BillingState;
                    	con.OtherPostalCode = accts.BillingPostalCode;
                    	con.OtherCountry = accts.BillingCountry;
           		}// End if
       		}// End for
  		}// End for
    }
}