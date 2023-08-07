public class LWCDemo {
    public static List<Account> getaAccounts(){
        return [Select Id,Name From Account Limit 20];
        
    }

}