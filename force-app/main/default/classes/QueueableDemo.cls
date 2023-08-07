public class QueueableDemo implements Queueable {
    
    public void execute (QueueableContext context){
        System.debug('Inside the queueable context..');
        
        List<Account> acc = new List<Account>([SELECT Id,Name FROM Account Limit 50]);
        
        System.debug('List of accounts ... '+ acc.size());
        
    }

}