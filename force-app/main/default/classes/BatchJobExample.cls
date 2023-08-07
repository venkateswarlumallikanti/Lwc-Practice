global class BatchJobExample implements Database.Batchable<sObject>{
    
    integer num = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('i m Start point...');
        return Database.getQueryLocator('SELECT ID,Name From Contact LIMIT 50');
        
    }
    
    global void execute(Database.BatchableContext bc , List<Contact> scope){
        System.debug('i m execute point...');
        for(integer i=1 ; i<=5 ; i++){
            num = i ;
        }
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('i m finish point...');
        System.debug('Number of batches executed ---- '+ num);
    }
   
   /* private Integer magicNum = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        //Start
        System.debug('i m Start method....');
        return Database.getQueryLocator('Select ID,Name From Account');
    } 
   
    global void execute(Database.BatchableContext bc , List<Account> Scope){
        //execute
        System.debug('I m execute Method....');
        for(integer i=0;i<5;i++){
            magicNum = i;
        }
    }
    
    global void finish(Database.BatchableContext bc){
        //finish
        System.debug('I m Finish Method...');
        System.debug('Magic Number --- '+ magicNum);
    }*/
}