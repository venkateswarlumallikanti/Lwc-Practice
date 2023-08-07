@isTest
public class DemoTestClass {
    @isTest(seeAllData = true)
    Static void AccountTest(){
        List<Account> acc = [Select Id,Name FROM Account LIMIT 15];
        system.assertEquals(15, acc.size(), 'Error message...');
    }
    
    @isTest
    Static void loadTestData(){
        List<Account> loadaData = Test.loadData(Account.sobjectType, 'LoadDataTest');
        Account acc = loadaData.get(0);
        System.debug('Account Records --- '+ acc);
        System.assertEquals(3, loadaData.size());
    }
    
    @isTest
    static void privatePropDemo1(){
        ApexHours.updatePriority(new Account(Name = 'Salesforce Inc.',Rating='Hot'));
    }
     @isTest
    static void privatePropDemo2(){
        ApexHours.updatePriority(new Account(Name = 'Salesforce Inc.',Rating='Warm'));
    }

     @isTest
    static void privatePropDemo3(){
        ApexHours.updatePriority(new Account(Name = 'Salesforce Inc.',Rating='Cold'));
    }


}