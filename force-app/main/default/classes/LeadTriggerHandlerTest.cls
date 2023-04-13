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
        Lead lead2 = new Lead(FirstName = 'lead2', LastName = 'xya1', Company = 'xyz2', Email = 'ASD45@LKJ.com');
        Lead lead3 = new Lead(FirstName = 'lead3', LastName = 'xya1', Company = 'xyz2', Email = 'ASD450@LKJ.com');
        
        Test.startTest();
        	Database.SaveResult result1 = Database.insert(lead1, false);
        	Database.SaveResult result2 = Database.insert(lead2, false);
        	Database.SaveResult result3 = Database.insert(lead3, false);
        Test.stopTest();
        List<Lead> leadList = [SELECT Id, FirstName, Email, Street, City, State, PostalCode, Country
                              	FROM Lead];
        //Positive Test
        System.assert(result1.isSuccess());
        System.assert(result2.isSuccess());
        System.assert(result3.isSuccess());
        System.assert(leadList.size() == 3);

        for(Lead leadRec : leadList){
            if(leadRec.Email == con1.Email){
                System.assertEquals(con1.OtherStreet, leadRec.Street);
                System.assertEquals(con1.OtherCity, leadRec.City);
                System.assertEquals(con1.OtherState, leadRec.State);
                System.assertEquals(con1.OtherPostalCode, leadRec.PostalCode);
                System.assertEquals(con1.OtherCountry, leadRec.Country);
            }//End if
            if(leadRec.FirstName == 'lead2'){
                System.assertEquals(con2.OtherStreet, leadRec.Street);
                System.assertEquals(con2.OtherCity, leadRec.City);
                System.assertEquals(con2.OtherState, leadRec.State);
                System.assertEquals(con2.OtherPostalCode, leadRec.PostalCode);
                System.assertEquals(con2.OtherCountry, leadRec.Country);
            }//End else
        }//End for
        //Nagative Test
        System.assertEquals(lead3.Street, null);
        System.assertEquals(lead3.City, null);
        System.assertEquals(lead3.State, null);
        System.assertEquals(lead3.PostalCode, null);
        System.assertEquals(lead3.Country, null);
    }
}