public with sharing class ApexUseCaseFive {
    
    public static Boolean checkIfCombinationExists(String contactName, String accountName){

        List<Contact> conRecords = [SELECT Id FROM Contact WHERE Name = :contactName AND Account.Name = :accountName];
        if (conRecords.size() > 0) {
            return true;
        } 
        
        return false;
    }
}