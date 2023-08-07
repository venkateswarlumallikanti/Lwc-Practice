trigger SendEmailToContactTrigger on Contact (before insert) {
    
    List<Messaging.SingleEmailMessage> emails = New List<Messaging.SingleEmailMessage>();
    for(Contact con : trigger.new){
        if(con.Email != null){
            Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
            singleMail.setTargetObjectId(con.Id);
            System.debug('Before Sending Email');
            singleMail.setHtmlBody('Hello your Contact Has been Created !!');
             System.debug('After Sending Email');
            singleMail.setTreatTargetObjectAsRecipient(true);
            List<String> emailList = New List<String>();
            emailList.add(con.Email);
            singleMail.setToAddresses(emailList);
            emails.add(singleMail);
        }
    }

}