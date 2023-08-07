public class AddNewAccountAndContact{

    public Contact contactRecord {get;set;}
    public Account accountRecord {get;set;}
        
        public void save()
    {
        //Creates new Account
         insert accountRecord;
        
        //Link AccountId and Contact
        contactRecord.AccountId = accountRecord.Id;
        
        //Creates New Contact
        insert contactRecord;
    }
}