trigger TriggerToPopulateObjectField on Contact (before insert) {

    Set<Id> setAccId = new Set<Id>();
    
    for(Contact con : Trigger.new){
        if(con.AccountId != null){
            setAccId.add(con.AccountId);//Add acct to set
        }
    }
    
    if(setAccId.size() > 0){
        List<Account> listAcct = [Select Id,Name,Phone From Account Where ID IN:setAccId];
        
        for(Contact con : Trigger.new){
            if(con.AccountId != null){
                for(Account acc : listAcct){
                    if(con.AccountId == acc.Id){
                        con.Phone = acc.Phone;
                    }
                }
            }
        }
    }
    
}