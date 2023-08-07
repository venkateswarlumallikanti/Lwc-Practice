trigger CaseCreationOnAccountTrigger on Account (after update) {
    List<Case> casesToInsert = new List<Case>();
    
    // Get the old and new account data
    Map<Id, Account> oldAccounts = new Map<Id, Account>();
    for (Account oldAccount : Trigger.old) {
        oldAccounts.put(oldAccount.Id, oldAccount);
    }
    
    for (Account newAccount : Trigger.new) {
        // Check if the account rating has changed to "Hot"
        if (newAccount.Rating == 'Hot' && oldAccounts.get(newAccount.Id).Rating != 'Hot') {
            
            // Lookup contact, account, and opportunity based on the account's phone number
            List<Contact> matchingContacts = [SELECT Id, AccountId FROM Contact WHERE Phone = :newAccount.Phone];
            List<Account> matchingAccounts = [SELECT Id FROM Account WHERE Phone = :newAccount.Phone];
            List<Opportunity> matchingOpportunities = [SELECT Id, AccountId FROM Opportunity WHERE AccountId IN :matchingAccounts];
            
            // Create a case for each matching contact, account, and opportunity
          
                for (Account matchingAccount : matchingAccounts) {
                        Case newCase = new Case();
                        newCase.Subject = 'New Case';
                        newCase.AccountId = matchingAccount.Id;
                        newCase.ContactId = newCase.ContactId;
                        newCase.Opportunity__c = newCase.Id;
                        casesToInsert.add(newCase);
                    }
                }
            }
    
    // Insert the new cases
    if (!casesToInsert.isEmpty()) {
        insert casesToInsert;
    }
}