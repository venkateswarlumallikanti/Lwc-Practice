@isTest
global class TestLatLong2Address implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request){
        String responseJSON = '{"latlongg" :17.38714 ,78.491684}';
        
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setBody(responseJson);
        return response;
    }
}