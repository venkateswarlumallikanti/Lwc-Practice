public class AccountTriggerHandler {
     public static void  CreateAccounts(List<Account> acctList)
    {
        for(Account a:acctList)
        {
            if(a.ShippingState != a.BillingState)
            {
                a.ShippingState = a.BillingState;
            }
        }
    }
}