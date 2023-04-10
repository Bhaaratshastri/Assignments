/**
 
**/
public class OpptyTriggerHandler1 {
    public static void updateOppty(List<Opportunity> opptyList){
		Set<id> listids = new Set<id>();
		for (Opportunity oppties : opptyList){
        	if (String.isNotBlank(oppties.AccountId)){
            	listids.add(oppties.AccountId);
        	}// End if
    	}// End for
		Map<id,account> accts = new Map<id,account>([select id,Latest_Oppty__c  from account where id in: listids]);
		for ( Opportunity oppties :opptyList)
		{
			Account myacc = accts.get(oppties.AccountId);
			myacc.Latest_Oppty__c=oppties.Id;
		}//End for
		Update accts.values();
    }
}