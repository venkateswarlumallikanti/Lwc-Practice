trigger LeadScenerio on Lead (before insert,before update) {

    for(Lead l : Trigger.new){
        if(l.LeadSource == 'Web'){
            l.Rating = 'Cold';
        }
        else{
            l.Rating = 'Hot';
        }
    
    }
}