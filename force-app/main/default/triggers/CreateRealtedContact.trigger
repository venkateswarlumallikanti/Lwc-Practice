trigger CreateRealtedContact on Account (after insert) {
    List<Account> accList = new List<Account>();
    
    for(Account acc : Trigger.new){
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        Con.LastName = Acc.Name;
        
    }
}