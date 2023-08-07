public class AccountSearch {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountData(String textKey) {

        textKey = '%' + textKey + '%';
        List<Account> accList = [Select Id ,Name From Account Where Name LIKE:textKey WITH SECURITY_ENFORCED];

        if(accList.isEmpty()){
            throw new AuraHandledException('NO Records Found');
        }

        return accList;

    }
}