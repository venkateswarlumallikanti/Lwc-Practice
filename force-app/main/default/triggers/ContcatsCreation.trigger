trigger ContcatsCreation on Contact (after insert) {
    
    List<Contact> listContacts = new List<Contact>();//Fro contact
    Map<Id,Decimal> mapAcc = new Map<Id,Decimal>(); // Check number loacions
    
    // for(Account acc:trigger.new){
      //  mapAcc.put(acc.Id, acc.NumberofLocations__c);
    // }
    
    if(mapAcc.size() > 0 && mapAcc != null)
    {
        for(Id accId : mapAcc.keySet()){
            for (integer i=0 ; i<mapAcc.get(accId) ; i++)
            {
                Contact con = new Contact();
                con.AccountId = accId;
                con.LastName = 'contact '+i;
                listContacts.add(con);
            }
        }
    }
     
    
    if(listContacts.size() > 0 && listContacts != NUll){
        insert listContacts;
    }
    
    
}