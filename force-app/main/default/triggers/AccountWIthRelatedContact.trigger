trigger AccountWIthRelatedContact on Account (after insert) {
    
    List<Contact> cont = new List<Contact>();
    for(Account acc : Trigger.new){
        if(acc.Industry == 'Banking'){
        Contact c = new Contact();
        c.AccountId = acc.Id;
        c.LastName = acc.Name;
        c.Phone = acc.Phone;
        cont.add(c);
        }
    }
    insert cont;

}