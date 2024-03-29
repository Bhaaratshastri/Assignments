/**
* Description: use to make Opportunity trigger logic less
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
public with sharing class OpptyTriggerHandler {
	//ownership private
    public static void ownershipPrivate(List<Opportunity> opptyList){
        Set<String> accountIds = new Set<String> ();
    	for (Opportunity oppty : opptyList){
            if (String.isNotBlank(oppty.AccountId)){
                accountIds.add(oppty.AccountId);
         	}// End if
    	}// End for
    	Set<String> privatAccts = new Set<String> ();
    	for (Account acct: [SELECT Id, Ownership 
                    FROM Account
                    WHERE Id IN :accountIds 
                    AND Ownership = 'Private']){
         		privatAccts.add(acct.Id);
    	}// End for
    	for (Opportunity oppty : opptyList){
            if(privatAccts.contains(oppty.AccountId)){
                oppty.AccountId.addError('Opportunity cannot be created. kindly contact your system administrator');
        	}// End if
    	}// End for
    }
    //ownership private + annualrevenue
    public static void ownershipPrivateAnnualRevenue(List<Opportunity> opptyList){
        Set<String> accountIds = new Set<String> ();
    	for (Opportunity oppty : opptyList){
        	if (String.isNotBlank(oppty.AccountId)){
            	accountIds.add(oppty.AccountId);
         	}// End if
    	}// End for
    	Set<String> privatAccts = new Set<String> ();
    	for (Account acct: [SELECT Id, Ownership, AnnualRevenue 
                    FROM Account
                    WHERE Id IN :accountIds 
                    AND Ownership = 'Private'
                    AND AnnualRevenue <= 50000]){
             privatAccts.add(acct.Id);
    	}// End for
    	for (Opportunity oppty : opptyList){
        	if(privatAccts.contains(oppty.AccountId)){
	        	oppty.addError('Opportunity cannot be created with this account. kindly contact your system administrator');
        	}// End if
    	}// End for
    }
    // delete oppty
    public static void deleteOppty(List<Opportunity> opptyList){
        Set<String> accountIds = new Set<String> ();
    	for (Opportunity oppty : opptyList){
        	if (String.isNotBlank(oppty.AccountId)){
            	accountIds.add(oppty.AccountId);
         	}// End if
    	}// End for
    	Set<String> privatAccts = new Set<String> ();
    	for (Account acct: [SELECT Id, Ownership 
                    FROM Account
                    WHERE Id IN :accountIds 
                    AND Ownership = 'Private']){
                privatAccts.add(acct.Id);
        }
    	for (Opportunity oppty : opptyList){
        	if(privatAccts.contains(oppty.AccountId)){
            	oppty.addError('Private Account was not be delete');
        	}// End if
    	}// End for
    }
    //ownership private + annualrev <50000 + oppty stage qualifiaction
    public static void ownershipPrivateAnnualrevOpptyStage(List<Opportunity> opptyList){
        Set<String> accountIds = new Set<String> ();
    	for (Opportunity oppty : opptyList){
        	if (String.isNotBlank(oppty.AccountId)){
            	accountIds.add(oppty.AccountId);
         	}// End if
    	}// End for
    	Set<String> privatAccts = new Set<String> ();
    	for (Account acct: [SELECT Id, Ownership, AnnualRevenue 
                    FROM Account
                    WHERE Id IN :accountIds 
                    AND Ownership = 'Private'
                    AND AnnualRevenue <= 50000]){
             privatAccts.add(acct.Id);
        }// End for
    	for (Opportunity oppty : opptyList){
        	if(privatAccts.contains(oppty.AccountId) && oppty.StageName.equals('Qualification')){
                oppty.StageName.addError('Opportunity cannot be created. kindly contact your system administrator');
         	}// End if
    	}// End for
    }
	//Update field on account
	public static void updateOppty(List<Opportunity> opptyList){
		Set<Id> listIds = new Set<Id>();
		for (Opportunity oppty : opptyList){
        	if (String.isNotBlank(oppty.AccountId)){
            	listIds.add(oppty.AccountId);
        	}// End if
    	}// End for
		Map<Id,Account> accts = new Map<Id,Account>([SELECT Id, Latest_Oppty__c  
														FROM account 
														WHERE Id in: listIds]);
		for ( Opportunity oppty :opptyList)
		{
			Account myacc = accts.get(oppty.AccountId);
			myacc.Latest_Oppty__c=oppty.Id;
		}//End for
		update accts.values();
    }
}




 //   System.assert(false, 'Stage 84 = '+oppty.StageName  + ' Condition = '+ oppty.StageName.equals('Qualification'));