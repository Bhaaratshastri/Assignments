public with sharing class LeadTriggerHandler {
        //update otherAddress 
	public static void updateLead(List<Lead> leadList){
        Set<String> emailIds = new Set<String> ();
    	for (Lead lead : leadList){
        	if (String.isNotBlank(lead.Email)){
					emailIds.add(lead.Email);
        	}// End if
    	}// End for
    	List<Contact> cons = [SELECT Id, Email, OtherStreet, OtherCity, OtherState, OtherPostalCode, OtherCountry 
								FROM Contact];
    	for(Lead lead : leadList){
        	for(Contact con : cons){
            	if(lead.Email ==  con.Email){
                    lead.Street = con.OtherStreet;
                    lead.City = con.OtherCity;
                    lead.State = con.OtherState;
                    lead.PostalCode = con.OtherPostalCode;
                    lead.Country = con.OtherCountry;
           		}// End if
       		}// End for
  		}// End for
    }
}
