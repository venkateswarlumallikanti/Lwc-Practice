public class MyControllerExtension {
    private final Account acc;
    
    public MyControllerExtension(ApexPages.StandardController std){
        this.acc = (Account)std.getRecord();
    }
    
    public string getGreeting(){
        return 'Hello '+acc.Name+' ('+acc.Id+' )';
    }

}