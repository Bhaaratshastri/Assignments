/**
* Description: I'll add it later
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
@isTest
public class ConTriggerHandlerTest {
	@IsTest
    static void testInsert1Oppty(){
        Account acct1 = new Account(Name = 'Test',BillingStreet = '2230/4', BillingCity = 'Surat', BillingState = 'Gujrat', BillingPostalCode = '356004', BillingCountry = 'India');
        insert acct1;
        Account acct2 = new Account(Name = 'Test',BillingStreet = '2298/9', BillingCity = 'ccc', BillingState = 'Gujrat', BillingPostalCode = '356004', BillingCountry = 'India');
        insert acct2;
        Contact con1 = new Contact(AccountId = acct1.Id , FirstName = 'Test1', LastName = 'xya');
        Contact con2 = new Contact(AccountId = acct2.Id , FirstName = 'Test10', LastName = 'xya1');
        Test.startTest();
        	Database.SaveResult result1 = Database.insert(con1, false);
        	Database.SaveResult result2 = Database.insert(con2, false);
        Test.stopTest();
        List<Contact> conList = [SELECT Id, AccountId, OtherStreet, OtherCity, OtherState, OtherPostalCode, OtherCountry
                              	FROM Contact];
        //Positive Test
        System.assert(result1.isSuccess());
        System.assert(conList.size()>0);
        
        for(Contact con : conList){
            if(con.AccountId == acct1.Id){
                System.assertEquals(acct1.BillingStreet, con.OtherStreet);
                System.assertEquals(acct1.BillingCity, con.OtherCity);
                System.assertEquals(acct1.BillingState, con.OtherState);
                System.assertEquals(acct1.BillingPostalCode, con.OtherPostalCode);
                System.assertEquals(acct1.BillingCountry, con.OtherCountry);
            }//End if
            else{
                System.assertEquals(acct2.BillingStreet, con.OtherStreet);
                System.assertEquals(acct2.BillingCity, con.OtherCity);
                System.assertEquals(acct2.BillingState, con.OtherState);
                System.assertEquals(acct2.BillingPostalCode, con.OtherPostalCode);
                System.assertEquals(acct2.BillingCountry, con.OtherCountry);
            }//End else
        }    
    }
}