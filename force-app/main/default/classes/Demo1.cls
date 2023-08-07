public class Demo1 {
    public void mainValueMethod(){      	//pass by value
        String webSiteUrl = 'www.apexhours.com';
        
        System.debug('Before value call '+webSiteUrl);
        passByValuecall(webSiteUrl);
        System.debug('After value call '+ webSiteUrl);
        
    }
    Private void passByValuecall(String webSiteUrlValue){
        webSiteUrlValue = 'www.salesforce.com';
    } 
    
    
    public void mainRefMethod(){
        Account a = new Account();
        a.Name = 'Test Account';
        a.Website = 'www.apexhours.com';
        
        System.debug('Before value call '+a);
        passByValuecall(a);
        System.debug('After value call '+ a);
        
    }
    Private void passByValuecall(Account a){		//pass by reference
        a.Website = 'www.salesforce.com';
    } 
    
}