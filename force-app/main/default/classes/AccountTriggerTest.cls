/**
* Description: Use to test Account trigger and trigger handler with diffrent senarios
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
@IsTest
private class AccountTriggerTest {
    @IsTest
    static void testHotParentAccountId(){
        Account acct1 = new Account(Name = 'Master Hot');
        insert acct1;
        
        Account acct2 = new Account(Name = 'Test',Rating = 'Hot');
        insert acct2;
        acct2 = [SELECT Id, ParentId
                FROM Account
                WHERE Id =: acct2.Id];
        System.assertEquals(acct2.ParentId,acct1.Id);
    }
    @IsTest
    static void testColdParentAccountId(){
        Account acct1 = new Account(Name = 'Master Cold');
        insert acct1;
        
        Account acct2 = new Account(Name = 'Test',Rating = 'Cold');
        insert acct2;
        acct2 = [SELECT Id, ParentId
                FROM Account
                WHERE Id =: acct2.Id];
        System.assertEquals(acct2.ParentId,acct1.Id);
    }
    @IsTest
    static void testWarmParentAccountId(){
        Account acct1 = new Account(Name = 'Master Warm');
        insert acct1;
        
        Account acct2 = new Account(Name = 'Test',Rating = 'Warm');
        insert acct2;
        acct2 = [SELECT Id, ParentId
                FROM Account
                WHERE Id =: acct2.Id];
        System.assertEquals(acct2.ParentId,acct1.Id);
    }
}