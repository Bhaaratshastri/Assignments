/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
@isTest
private class OpptyTriggerHandlerTest1 {
    @IsTest
    static void testOpptyId() {
        Account acct1 = new Account(Name = 'Test1', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct1;
        Account acct2 = new Account(Name = 'Test2', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct2;
        Opportunity oppty1 = new Opportunity(AccountId = acct1.Id , Name = 'Test1', StageName = 'Qualification', CloseDate = System.today());
        Opportunity oppty2 = new Opportunity(AccountId = acct2.Id , Name = 'Test2', StageName = 'Qualification', CloseDate = System.today());
        Test.startTest();
        	Database.SaveResult result1 = Database.insert(oppty1, false);
        	Database.SaveResult result2 = Database.insert(oppty2, false);
        Test.stopTest();
        List<Account> acctList = [SELECT Id, Latest_Oppty__c
                              	FROM Account];
        System.assert(result1.isSuccess());
        System.assert(result2.isSuccess());
        System.assert(acctList.size()>0);        
        System.assertEquals(oppty1.Id, acct1.Latest_Oppty__c);
        System.assertEquals(oppty2.Id, acct2.Latest_Oppty__c);
    }
}