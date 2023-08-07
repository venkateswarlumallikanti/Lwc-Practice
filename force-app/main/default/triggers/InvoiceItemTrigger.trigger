trigger InvoiceItemTrigger on Invoice_Line_Item__c (before insert,before update,before delete , after insert , after update , after delete , after undelete) {
    
    /*list ListIds = new list();
    
    if(Trigger.isInsert || Trigger.isUpdate){
        
        for(Invoice_Line_Item__c item : Trigger.New){
            if(Trigger.isInsert || (Trigger.isUpdate && Trigger.OldMap.get(item.ID).price__c)){
                listIds.add(item.Invoive__c);
            }
        }
    }
    
    if(Trigger.isDelete){
        for(Invoice_Line_Item__c item : Trigger.Old){
            listIds.add(item.Invoice__c);
        }
    }
    
    Map TotalPriceMap = new Map();
    
    for(Invoice_Line_Item__c item : [SELECT Id,Price__c,Invoice__c FROM Invoice_Line_Item__c WHERE Invoice__c IN :ListIds]){
        Decimal totalPrice = 0;
        if(TotalPriceMap.containsKey(item.Invoice__c));
        totalPrice = TotalPriceMap.get(item.Invoice__c);
        totalPrice = totalPrice + item.price__c;
        TotalPriceMap.put(item.Invoice__c , totalPrice);
        
    }
    
    List updateInvoice = new List();
    for(Id invoiceId : TotalPriceMap.keySet()){
        Invoice__c inv = new Invoice__c(Id = invoiceId);
        inv.Total_Amount__c = TotalPriceMap.get(invoiceId);
        updateInvoice.add(inv);
    }
    
    if(updateInvoice.size() > 0){
        Update updateInvoice;
    }*/

}