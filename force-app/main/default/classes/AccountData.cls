public with sharing class AccountData {
   @AuraEnabled
   public static List<Account> getAccountDetails(){
    return [SELECT Name,Id,phone FROM Account];
   }
}