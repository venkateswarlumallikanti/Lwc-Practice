public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getProducts(String ProName){
       String ProNameLike = '%'+ProName+'%';
       List<PricebookEntry> proList = [SELECT ID,Product2.name , product2.productcode , 
                                        product2.Description , product2.family , UnitPrice  
                                        FROM PricebookEntry WHERE Product2.Name LIKE :ProNameLike];

        return proList ;
    }

    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getPriceBookEntry(){
        List<PricebookEntry> proList = [SELECT ID , Product2.Name,
                                        Product2.ProductCode,
                                        Product2.Description,
                                        Product2.Family,
                                        UnitPrice 
                                        FROM PricebookEntry LIMIT 20];
        return proList;
    }

    @AuraEnabled
    public static Boolean addedProductFunction1(List<String> quantityInstance , List<String> salesListInstance , String oppId , List<String> pbeList){
        List<OpportunityLineItem> oppliList = new List<OpportunityLineItem>();
        for(integer x=0; x< quantityInstance.size();x++){
            OpportunityLineItem oppLine = new OpportunityLineItem();
            oppLine.OpportunityId = oppId;
            oppLine.PricebookEntryId = pbeList[x];

            oppLine.Quantity = Decimal.valueOf(quantityInstance[x]);
            oppLine.UnitPrice = Decimal.valueOf(salesListInstance[x]);
            oppliList.add(oppLine);
        }
        insert oppliList;
        return true;
    }
}