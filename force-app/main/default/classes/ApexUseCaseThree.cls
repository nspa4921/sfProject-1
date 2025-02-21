public with sharing class ApexUseCaseThree {
    public static void sendAlertToCustomer(String emailAddress) {

        if(!String.isBlank(emailAddress)) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> toAddressList = new List<String>{emailAddress};
            mail.setSubject('URGENT - Take a look');
            mail.setPlainTextBody('This is a notification that you have a new message in your inbox.');
            mail.setToAddresses(toAddressList); 

            String signature = '<br/>Nemanja';
            mail.setHtmlBody('<html><body><p>This is a notification that you have a new message in your inbox.</p><p>' + signature + '</p></body></html>');
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}