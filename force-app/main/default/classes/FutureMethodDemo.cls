global class FutureMethodDemo {
    public static void processRecords(List<ID> recIds){
        //gte records based on ids 
        System.debug('inside future method');
        List<Account> accts = [SELECT Name FROM Account WHERE Id IN :recIds];
        System.debug('accts list -- '+accts);
    }

}