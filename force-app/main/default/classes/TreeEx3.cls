public with sharing class TreeEx3 {
    @AuraEnabled(cacheable=true)
     public static List<AccountWrapper> getTreeData(){
         List<Account> accs = [Select Id , Name,(Select Id , Name from Contacts) from Account];
         List<AccountWrapper> aooo = new List<AccountWrapper>();
         for(Account a : accs){
             AccountWrapper aWraper = new AccountWrapper() ;
             aWraper.name =a.Name ;
             aWraper.label =a.Name ;
             aWraper.expanded =true ;
             List<Items> co = new List<Items>();
             for(Contact c : a.Contacts){
                 Items conWrapp = new Items();
                 conWrapp.name =c.Name ;
                 conWrapp.label =c.Name ;
                 conWrapp.expanded =true ;
                 co.add(conWrapp);
             }
             aWraper.items = co;
             aooo.add(aWraper);
         }
        return aooo;
     }
     public Class AccountWrapper{
         @AuraEnabled
         public String name{get;set;}
         @AuraEnabled
         public String label{get;set;}
         @AuraEnabled
         public Boolean expanded{get;set;}
         @AuraEnabled
         public List<Items> items{get;set;}
     }
     public Class Items{
         @AuraEnabled
         public String name{get;set;}
         @AuraEnabled
         public String label{get;set;}
         @AuraEnabled
         public Boolean expanded{get;set;}
     }
 }