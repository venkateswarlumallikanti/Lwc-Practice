@isTest
public class TestOppProduct {
    static testmethod void testProductMethod(){
        
        Product2 prod = new Product2(Name = 'GenWatt Diesel 1000kW' );
        insert prod;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prod.Id,
            UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        
        Opportunity opp = new Opportunity(Name='Test',
                                          NextStep='test',
                                          PriceBook2 = customPB,
                                          StageName = 'Closed Won',
                                          CloseDate = System.today(),
                                          Probability=100);
        
        insert opp; 
        
        OpportunityLineItem oppLine = new OpportunityLineItem(OpportunityId=opp.Id,
            													Product2Id = Prod.Id,
                                                             UnitPrice=15000,
                                                             Quantity=2,
                                                             PricebookEntryId = customPrice.Id);
        
            
            insert oppLine;
            
        
    Test.startTest();
    ProductController.getProducts('GenWatt Diesel 1000kW');
    ProductController.getPriceBookEntry();
    ProductController.addedProductFunction1(new List<String>{'2'},new List<String>{'200.00'},opp.Id,new List<String>{customPrice.Id});
    //ProductController.addedProductFunction1(null,null,'',null);   
    Test.stopTest();
      
    }
    
    
}