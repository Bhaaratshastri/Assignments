/**
* Description: Use to test Opportunity trigger and trigger handler with diffrent senarios
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
@isTest
private class OpptyTriggerHandlerTest {
	@IsTest //use to test ownershipPrivate method
    static void testInsert1Oppty(){
        Account acct1 = new Account(Name = 'Test', Ownership = 'Private', AnnualRevenue = 500000);
        insert acct1;

        Account acct2 = new Account(Name = 'Test', Ownership = 'Public', AnnualRevenue = 5000);
        insert acct2;       
        Opportunity oppty1 = new Opportunity(AccountId = acct1.Id , Name = 'Test1', StageName = 'Qualification', CloseDate = System.today());
        Opportunity oppty2 = new Opportunity(AccountId = acct2.Id , Name = 'Test2', StageName = 'Qualification', CloseDate = System.today());
        Test.startTest();
        	Database.SaveResult nresult = Database.insert(oppty1, false);
        	Database.SaveResult presult = Database.insert(oppty2, false);
        Test.stopTest();
        //Nagative Test 
        System.assert(!nresult.isSuccess());
        System.assert(nresult.getErrors().size() > 0);
        System.assertEquals('Opportunity cannot be created. kindly contact your system administrator',
                             nresult.getErrors()[0].getMessage());
        //Positive Test
        System.assert(presult.isSuccess());
        System.assertNotEquals(oppty2.Id, null);       
    }
    @IsTest //use to test ownershipPrivateAnnualRevenue method
    static void testInsert2Oppty(){
        Account acct1 = new Account(Name = 'Test', Ownership = 'Private', AnnualRevenue = 5000);
        insert acct1;

        Account acct2 = new Account(Name = 'Test', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct2;
                
        Opportunity oppty1 = new Opportunity(AccountId = acct1.Id , Name = 'Test1', StageName = 'Qualification', CloseDate = System.today());
        Opportunity oppty2 = new Opportunity(AccountId = acct2.Id , Name = 'Test2', StageName = 'Qualification', CloseDate = System.today());
        Test.startTest();
        	Database.SaveResult nresult = Database.insert(oppty1, false);
        	Database.SaveResult presult = Database.insert(oppty2, false);
        Test.stopTest();
        //Nagative Test 
        System.assert(!nresult.isSuccess());
        System.assert(nresult.getErrors().size() > 0);
        System.assertEquals('Opportunity cannot be created. kindly contact your system administrator',
                             nresult.getErrors()[0].getMessage());
        //Positive Test
        System.assert(presult.isSuccess());
        System.assertNotEquals(oppty2.Id, null);
    }
    @IsTest //use to test ownershipPrivateAnnualrevOpptyStage method
    static void testInsert3Oppty(){
        Account acct1 = new Account(Name = 'Test', Ownership = 'Private', AnnualRevenue = 5000);
        insert acct1;

        Account acct2 = new Account(Name = 'Test', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct2;
                
        Opportunity oppty1 = new Opportunity(AccountId = acct1.Id , Name = 'Test1', StageName = 'Qualification', CloseDate = System.today());
        Opportunity oppty2 = new Opportunity(AccountId = acct2.Id , Name = 'Test2', StageName = 'Prospecting', CloseDate = System.today());
        Test.startTest();
        	Database.SaveResult nresult = Database.insert(oppty1, false);
        	Database.SaveResult presult = Database.insert(oppty2, false);
        Test.stopTest();
        //Nagative Test 
        System.assert(!nresult.isSuccess());
        System.assert(nresult.getErrors().size() > 0);
        System.assertEquals('Opportunity cannot be created. kindly contact your system administrator',
                             nresult.getErrors()[0].getMessage());
        //Positive Test
        System.assert(presult.isSuccess());
        System.assertNotEquals(oppty2.Id, null);    
    }
    @IsTest//use to test deleteOppty method
    static void testDeleteOppty(){
        Account acct1 = new Account(Name = 'Test', Ownership = 'Private', AnnualRevenue = 500000);
        insert acct1;
        Account acct2 = new Account(Name = 'Test', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct2;
        
        Opportunity oppty1 = new Opportunity(AccountId = acct2.Id , Name = 'Test1', StageName = 'qualifiaction', CloseDate = system.today());
        insert oppty1;
        oppty1.AccountId = acct1.Id;
        update oppty1;
        
         Test.startTest();
        Database.DeleteResult result = Database.delete(oppty1, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Private Account was not be delete', result.getErrors()[0].getMessage());
    }
    @IsTest//use to test updateOppty method
    static void testOpptyId() {
        Account acct1 = new Account(Name = 'Test1', Ownership = 'Public', AnnualRevenue = 500000);
        insert acct1;
        acct1 = [SELECT Id, Latest_Oppty__c
                FROM Account
                WHERE Id =: acct1.Id];
        System.assertEquals(acct1.Latest_Oppty__c, null);
        Opportunity oppty1 = new Opportunity(AccountId = acct1.Id , Name = 'Test1', StageName = 'Qualification', CloseDate = System.today());
        Test.startTest();
        	Database.SaveResult result1 = Database.insert(oppty1, false);
        Test.stopTest();
        acct1 = [SELECT Id, Latest_Oppty__c
                FROM Account
                WHERE Id =: acct1.Id];
        System.assert(result1.isSuccess());        
        System.assertEquals(oppty1.Id, acct1.Latest_Oppty__c);
        
        Opportunity oppty2 = new Opportunity(AccountId = acct1.Id , Name = 'Test2', StageName = 'Qualification', CloseDate = System.today());
        Database.SaveResult result2 = Database.insert(oppty2, false);
        acct1 = [SELECT Id, Latest_Oppty__c
                FROM Account
                WHERE Id =: acct1.Id];
        System.assert(result2.isSuccess());
        System.assertEquals(oppty2.Id, acct1.Latest_Oppty__c);
    }
}