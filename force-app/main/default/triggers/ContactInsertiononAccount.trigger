trigger ContactInsertiononAccount on Account (after insert) {
   
    List<Contact> conts = new List<Contact>();

    for (Account acc : Trigger.new) {
        if(acc.Industry == 'Banking'){
            Contact c = new Contact();
            c.AccountId = acc.Id;
            c.LastName = acc.Name;
            c.Phone = acc.Phone;
            conts.add(c);
        }
    }
    insert conts;

}