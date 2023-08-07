public class DynamicSoql {
	Public String oppName {set;get;}
	Public String oppStageName {set;get;}   
    Public List<Opportunity> opp{set;get;}   
    
    public DynamicSoql(){
        opp=[select name,stageName from Opportunity];
    }
    public void dynamicSearch(){
        String query ='select name,stageName from Opportunity';
        if(string.isNotBlank(oppName)&& string.isNotBlank(oppStageName))
        {
            query= query+' where name LIKE \'%'+oppName+'%\' and StageName LIKE \'%'+oppStageName+'%\'';
        }
        else{
                if(string.isNotBlank(oppName))
                {
                   query= query+' where name LIKE \'%'+ oppName +'%\'';
                }
            else
            {
                if(string.isNotBlank(oppStageName))
                { 
                  query=query+' where StageName LIKE \'%'+oppStageName+'%\'';
                }
            }
        }
        opp=Database.query(query);
    }
}