trigger TestTriggerOnAccount on Account (before insert , before Update , after Update) {
    
    if(Trigger.isBefore && Trigger.IsInsert){
        System.debug('i m in before insert context');
    }
    
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc : Trigger.New){
                System.debug('old NAme -- '+ acc.Name);
            }
        }
        if(Trigger.isAfter){
            for(Account acc : Trigger.New){
                System.debug('New NAme --- '+ Trigger.oldMap.get(acc.Id).Name);
            }
        }
    }

}