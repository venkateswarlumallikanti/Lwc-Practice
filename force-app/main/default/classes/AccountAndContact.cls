public class AccountAndContact {

    public Account accountRecord {get;set;}
    public Contact contactRecord {get;set;}
       
    public AccountAndContact() {
        accountRecord = new Account();
        contactRecord = new Contact();
    }
        public PageReference save() {
            SavePoint sp = Database.setSavepoint();
        try {
        //Creates new Account
         insert accountRecord;
              
        //Link AccountId and Contact
        contactRecord.AccountId = accountRecord.Id;
        
        //Creates New Contact
        insert contactRecord;
        }catch(Exception e){
            Database.rollback(sp);
            return null;
        }
      
        
        return new PageReference('/' + accountRecord.Id);
    }
}