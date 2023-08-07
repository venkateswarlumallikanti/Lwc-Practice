trigger CaseOrigin on Case (before insert) {

    for(case c : Trigger.new){
        if(c.origin == 'Web'){
            c.status = 'Working';
            c.Priority = 'High';
        }
    }
}