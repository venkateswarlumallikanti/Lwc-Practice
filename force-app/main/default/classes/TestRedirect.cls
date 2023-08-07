public class TestRedirect {
     @AuraEnabled
    public static List<Opportunity> PageRedirect() {
        List<Opportunity> allegations = [SELECT Id,Name FROM Opportunity WHERE StageName = 'closed won'];

        return allegations;
    }

}