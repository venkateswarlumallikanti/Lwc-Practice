@isTest
public class TestAddress {
    static testMethod void testPostCallout(){
        Test.startTest();
        system.debug('Start test');
        Test.setMock(HttpCalloutMock.class,new TestLatLong2Address());
        WeatherClass.fun1('17.38714,78.491684');
        //system.debug( WeatherClass.fun1('17.38714,78.491684'));
        system.debug('End test');
        Test.stopTest();
    }

}