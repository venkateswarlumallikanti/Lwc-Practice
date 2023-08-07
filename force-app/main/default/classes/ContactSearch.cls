public with sharing class ContactSearch {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactData(String textKey){

        textKey = '%' + textKey + '%';

        List<Contact> conList = [SELECT ID,Name,Phone FROM Contact WHERE Name LIKE:textKey WITH SECURITY_ENFORCED];

        if(conList.isEmpty()){
           throw new AuraHandledException('No contcat Found');
        }

        return conList;

    }
}