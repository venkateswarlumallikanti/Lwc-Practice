global class StateFulBatchDemo implements Database.Batchable<sObject> , Database.Stateful {
    
    private integer magicNum = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
         System.debug('i m Start Method...');
        return Database.getQueryLocator('Select Id,name From Account LIMIT 20');
       
    }
    
    global void execute(Database.BatchableContext bc , List<Account> scope){
        System.debug('i m execute method...');
        for(integer i=1 ; i<=5 ; i++){
            magicNum = i;
        }
        System.debug('Scope -- '+ scope);
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('I m Finish method...');
        System.debug('Magicnum --- '+ magicNum);
    }

}