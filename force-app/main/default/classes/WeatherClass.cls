public with sharing class WeatherClass {
    @AuraEnabled
public static JSON2Apex weatherData(String latlongg)
{
    try{
    Http h =new Http();
    HttpRequest req = new HttpRequest();
    System.debug('add-->'+latlongg);
    req.setEndpoint('https://weatherapi-com.p.rapidapi.com/current.json?q='+latlongg);
    req.setMethod('GET');
    req.setHeader('X-RapidAPI-Host', 'weatherapi-com.p.rapidapi.com');
    req.setHeader('x-rapidapi-key', '7dcbcb4875msh2d86ceb98b09cc2p15139fjsndd82549f92e0');
    HttpResponse responseBody = h.send(req);
    JSON2Apex customJsonForm =(JSON2Apex) System.JSON.deserialize(responseBody.getBody(), JSON2Apex.class);
    system.debug('body-->'+responseBody.getBody());
    system.debug('size-->'+customJsonForm.current.temp_c);
    return customJsonForm;
    }
    catch(exception e){
        system.debug(e);
        return null;
    }
}
    public class JSON2Apex {
    @AuraEnabled
    public CurrentClass current;
    }
public class CurrentClass{
    @AuraEnabled
    public String temp_c;

    @AuraEnabled
    public String temp_f;

    @AuraEnabled
    public ConditionClass condition;
    }
public class ConditionClass{
    @AuraEnabled
    public String text;

    @AuraEnabled
    public String wind_kph;

    @AuraEnabled
    public String icon;
    }
}