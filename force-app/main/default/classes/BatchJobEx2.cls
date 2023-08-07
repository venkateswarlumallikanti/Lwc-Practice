public with sharing class BatchJobEx2 implements Database.Batchable<SObject> {

    Integer num = 0;

    //Start
   global Database.QueryLocator start(Database.BatchableContext bc){
    System.debug('i m inside start');
    return Database.getQueryLocator('SELECT Id,Name FROM Contact LIMIYT 50');
   }

   //Execute
   global void execute(Database.BatchableContext bc, List<Contact> scope){
    System.debug('I m Iside Execute');
    for(integer i=1;i<=5;i++){
        num = i;
    }
   }

   //Finish
   global void finish(Database.BatchableContext bc){
    System.debug('i m inside finish');
    System.debug('no of batches executed --- '+ num);
   }
}