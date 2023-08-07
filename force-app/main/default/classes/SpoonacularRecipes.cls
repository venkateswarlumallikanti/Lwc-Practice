public with sharing class SpoonacularRecipes {
    private static final String SPOONACLAR_API = 'https://api.spoonacular.com';
    private static final String API_KEY = '0b020225d6e1406b9e09acf0f97d00fe';

    public static void getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACLAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug('response '+ response.getBody());
        }
    }
    
    
    public static void RecipeList(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACLAR_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        //https://api.spoonacular.com/recipes/{id}/information  (reference link)
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug('response '+ response.getBody());
        }
    }
    
    public static void RecipeByIngrident(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACLAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        //https://api.spoonacular.com/recipes/findByIngredients (reference Link)
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug('response '+ response.getBody());
        }
    }
}