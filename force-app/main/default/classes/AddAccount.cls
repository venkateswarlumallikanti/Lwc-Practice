public class AddAccount {
  public Contact newCon {get;set;}

   public AddAccount(ApexPages.StandardController con){
      newCon = (Contact)con.getRecord();
}
}