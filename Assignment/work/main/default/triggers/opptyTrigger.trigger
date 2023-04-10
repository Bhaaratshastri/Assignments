/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 5-Apr-2023
**/
trigger opptyTrigger on Opportunity (before insert, before delete) {
    if (Trigger.isInsert) {
        opptyTriggerHandler.ownershipPrivate(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualrevOpptyStage(Trigger.new);
        opptyTriggerHandler.ownershipPrivateAnnualRevenue(Trigger.new);
    }

    if (Trigger.isDelete) {
        opptyTriggerHandler.deleteOppty(Trigger.old);
    }
}




/**
//ownership private + annualrev <50000 + oppty stage qualifiaction
trigger opptyTrigger on Opportunity (before insert) {
    Set<String> accountIds = new Set<String> ();
    for (Opportunity oppty : Trigger.new){
        if (String.isNotBlank(oppty.AccountId)){
            accountIds.add(oppty.AccountId);
         }
    }
    Set<String> privatAccts = new Set<String> ();
    for (Account acct: [SELECT Id, Ownership, AnnualRevenue 
                FROM Account
                WHERE Id IN :accountIds 
                AND Ownership = 'Private'
                AND AnnualRevenue <= 50000]){
         privatAccts.add(acct.Id);
    }
    for (Opportunity oppty : Trigger.new){
        if(privatAccts.contains(oppty.AccountId)){
            If(oppty.StageName.contains('Qualification')){
                		oppty.addError('Opportunity cannot be created. kindly contact your system administrator');
            }
         }
    }       
}

// delete trigger
trigger opptyTrigger on Opportunity (before delete) {
    Set<String> accountIds = new Set<String> ();
    for (Opportunity oppty : Trigger.old){
        if (String.isNotBlank(oppty.AccountId)){
            accountIds.add(oppty.AccountId);
         }
    }
    Set<String> privatAccts = new Set<String> ();
    for (Account acct: [SELECT Id, Ownership 
                FROM Account
                WHERE Id IN :accountIds 
                AND Ownership = 'Private']){
         	privatAccts.add(acct.Id);
    }
    for (Opportunity oppty : Trigger.old){
        if(privatAccts.contains(oppty.AccountId)){
            oppty.addError('Private Account was not be delete');
        }
    }
}
//ownership private + annualrevenue
trigger opptyTrigger on Opportunity (before insert) {
    Set<String> accountIds = new Set<String> ();
    for (Opportunity oppty : Trigger.new){
        if (String.isNotBlank(oppty.AccountId)){
            accountIds.add(oppty.AccountId);
         }
    }
    Set<String> privatAccts = new Set<String> ();
    for (Account acct: [SELECT Id, Ownership, AnnualRevenue 
                FROM Account
                WHERE Id IN :accountIds 
                AND Ownership = 'Private'
                AND AnnualRevenue <= 50000]){
         privatAccts.add(acct.Id);
    }
    for (Opportunity oppty : Trigger.new){
        if(privatAccts.contains(oppty.AccountId)){
	        oppty.addError('Opportunity cannot be created with this account. kindly contact your system administrator');
        }
    }
}
//ownership private
trigger opptyTrigger on Opportunity (before insert) {
    Set<String> accountIds = new Set<String> ();
    for (Opportunity oppty : Trigger.new){
         if (String.isNotBlank(oppty.AccountId)){
        	accountIds.add(oppty.AccountId);
         }
    }
    Set<String> privatAccts = new Set<String> ();
    for (Account acct: [SELECT Id, Ownership 
                FROM Account
                WHERE Id IN :accountIds 
                AND Ownership = 'Private']){
         	privatAccts.add(acct.Id);
    }

    for (Opportunity oppty : Trigger.new){
        if(privatAccts.contains(oppty.AccountId)){
        	oppty.AccountId.addError('Account is Private');
        }
    }
}
**/