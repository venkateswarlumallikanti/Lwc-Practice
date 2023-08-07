public class OpportunityInformationPage {public opportunity oppstring{get; set;}
                                          public OpportunityInformationPage(){oppstring= new opportunity();}
                                          public void Saveto(){opportunity opp= new opportunity();opp.Accountid= oppstring.Accountid;opp.name= oppstring.name;
opp.closedate= oppstring.closedate;

opp.StageName= oppstring.StageName;

opp.leadSource= oppstring.LeadSource;

opp.Ownerid= oppstring.Ownerid;

opp.Amount= oppstring.Amount;

opp.IsPrivate= oppstring.IsPrivate;

opp.NextStep= oppstring.NextStep;

opp.Type= oppstring.Type;

opp.Probability= oppstring.Probability;

opp.Campaignid= oppstring.Campaignid;

opp.OrderNumber__c= oppstring.OrderNumber__c;

opp.MainCompetitors__c= oppstring.MainCompetitors__c;

opp.CurrentGenerators__c= oppstring.CurrentGenerators__c;

opp.DeliveryInstallationStatus__c= oppstring.DeliveryInstallationStatus__c;

opp.TrackingNumber__c= oppstring.TrackingNumber__c;

insert opp;

}

}