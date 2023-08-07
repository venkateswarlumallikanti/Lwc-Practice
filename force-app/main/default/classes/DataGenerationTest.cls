@isTest
private class DataGenerationTest {
  @testSetup
  static void dataCreation() {
      Account account = TestFactory.getAccount('Muddy Waters Inc.', true);
      Contact contact = TestFactory.getContact(account.Id, 'Muddy', 'Waters', true);
      Opportunity opp = New Opportunity();
      opp.Name = 'Long lost record';
      opp.AccountId = account.Id;
      opp.CloseDate = Date.today().addDays(14);
      opp.StageName = 'Prospecting';
      insert opp;
  }
  @isTest
  static void testBruteForceAccountCreation() {
      List<Account> accts = new List<Account>();
      Test.startTest();
          accts = [SELECT Id FROM Account];
      Test.stopTest();
      Assert.areNotEqual(0, accts.size());
  }
  @isTest
  static void testUseTestFactoryToCreateAccountsWithContacts() {
      List<Account> accts;
      List<Contact> contacts;
      TestFactory.generateAccountWithContacts(5);
      Test.startTest();
          accts = [SELECT Id FROM Account];
          contacts = [SELECT Id FROM Contact];
      Test.stopTest();
      Assert.areNotEqual(0, accts.size());
      Assert.areEqual(6, contacts.size());
      Assert.areNotEqual(accts.size(), contacts.size());
      }
  @isTest
  static void testAtTestSetupMethodsRule() {
      List<Opportunity> opps = [SELECT Id, AccountId FROM Opportunity];
      Assert.areEqual(1, opps.size());
  }
}