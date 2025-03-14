public with sharing class ApexUseCaseFour {
    public static List<String> returnContactEmails(String accountName){
        List<String> emailList = new List<String>();
        // Use the account name to query the account id
        // Use the account id to query the contacts whose parent account is the account id
        // loop through the contacts and extract the email addresses
        // return the list of email addresses

        // List<Account> accName = [SELECT Id FROM Account WHERE Name = :accountName LIMIT 1];
            List<Contact> contactRecords = [SELECT Id, Email FROM Contact WHERE Account.Name = :accountName];
            for(Contact con : contactRecords){
                if(con.Email != null){
                    emailList.add(con.Email);
                }
            }
        return emailList;
    }
}