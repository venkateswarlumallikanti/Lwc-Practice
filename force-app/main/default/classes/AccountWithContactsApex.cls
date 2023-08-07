public with sharing class AccountWithContactsApex {
        @auraEnabled(cacheable=true)
        public static List<Account> allAccountsWithContacts() {
                return [ SELECT Id, Name, Industry, ( SELECT Id, Subject FROM Tasks ),
		( SELECT Id, Name FROM Contacts ) FROM Account LIMIT 10 ];
       
        }
    }