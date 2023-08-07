public class ApexHours {
    
    public String Fname;
    public String lName;
    
    @TestVisible
    private static void updatePriority(Account accountRecord){
        if(accountRecord.Rating.equals('Hot')){
            accountRecord.CustomerPriority__c = 'High';
            
        }	else If (accountRecord.Rating.equals('Warm')){
            accountRecord.CustomerPriority__c = 'Medium';
        }	else{
            accountRecord.CustomerPriority__c = 'Low';
        }
    }
    
    public List<Account> accList {get ; set;}
       /*public List<Account> accList;
    
    public List<Account> getmethod(){
        return accList;
        
    }
    public void setmethod(List<Account> accs){
        this.accList = accs;
        
    }*/
    
    
        public ApexHours(){
            accList = [SELECT Id ,Name From Account Limit 100];
        }   

}