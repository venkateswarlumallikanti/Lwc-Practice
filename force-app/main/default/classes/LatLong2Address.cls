public with sharing class LatLong2Address {
    @AuraEnabled
    public static String addressData(String lat,String longg)
    {
        try{
        Http h =new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://address-from-to-latitude-longitude.p.rapidapi.com/geolocationapi?lat='+lat+'&lng='+longg);
        req.setMethod('GET');
        req.setHeader('X-RapidAPI-Host', 'address-from-to-latitude-longitude.p.rapidapi.com');
        req.setHeader('x-rapidapi-key', '81a938522emsh757ccc002cbf902p1b3920jsn94d56aa85202');
        HttpResponse responseBody = h.send(req);
        JSON2Apex customJsonForm =(JSON2Apex) System.JSON.deserialize(responseBody.getBody(), JSON2Apex.class);
        system.debug('body-->'+responseBody.getBody());
        system.debug('size-->'+customJsonForm.Results[0].address);
        return customJsonForm.Results[0].address;
        }
        catch(exception e){
            return 'someting went wrong';
        }
    }
    public class JSON2Apex {
        @AuraEnabled
        public List<Result> Results;
    }
    public class Result{
        @AuraEnabled
        public String address;
    }
}