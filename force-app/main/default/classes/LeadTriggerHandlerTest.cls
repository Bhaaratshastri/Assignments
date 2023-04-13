/**
* Description: Use to test Lead trigger and trigger handler with diffrent senarios
 * Created By: Bhaarat Shastri
 * Created Date: 11-Apr-2023
**/
@isTest
private class LeadTriggerHandlerTest {
    @IsTest
    static void testInsertLead(){
        Contact con1 = new Contact(FirstName = 'Test1', LastName = 'Demo1', Email = 'ASD@LKJ.com', OtherStreet = '2230/4', OtherCity = 'Surat', OtherState = 'Gujrat', OtherPostalCode = '356004', OtherCountry = 'India');
        insert con1;
        Contact con2 = new Contact(FirstName = 'Test2', LastName = 'Demo2', Email = 'ASD45@LKJ.com', OtherStreet = '2298/9', OtherCity = 'ccc', OtherState = 'Gujrat', OtherPostalCode = '356004', OtherCountry = 'India');
        insert con2;
        Lead lead1 = new Lead(FirstName = 'Test1', LastName = 'xya', Company = 'xyz', Email = 'ASD@LKJ.com');
        Lead lead2 = new Lead(FirstName = 'Test10', LastName = 'xya1', Company = 'xyz2', Email = 'ASD45@LKJ.com');
        Test.startTest();
        	Database.SaveResult result1 = Database.insert(lead1, false);
        	Database.SaveResult result2 = Database.insert(lead2, false);
        Test.stopTest();
        List<Lead> leadList = [SELECT Id, Email, Street, City, State, PostalCode, Country
                              	FROM Lead];
        //Positive Test
        System.assert(result1.isSuccess());
        System.assert(leadList.size()>0);
        
        for(Lead lead : leadList){
            if(lead1.Email == con1.Email){
                System.assertEquals(con1.OtherStreet, lead1.Street);
                System.assertEquals(con1.OtherCity, lead1.City);
                System.assertEquals(con1.OtherState, lead1.State);
                System.assertEquals(con1.OtherPostalCode, lead1.PostalCode);
                System.assertEquals(con1.OtherCountry, lead1.Country);
            }//End if
            else{
                System.assertEquals(con2.OtherStreet, lead2.Street);
                System.assertEquals(con2.OtherCity, lead2.City);
                System.assertEquals(con2.OtherState, lead2.State);
                System.assertEquals(con2.OtherPostalCode, lead2.PostalCode);
                System.assertEquals(con2.OtherCountry, lead2.Country);
            }//End else
        }    
    }
}