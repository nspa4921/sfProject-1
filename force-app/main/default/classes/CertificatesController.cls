public with sharing class CertificatesController {
    @AuraEnabled(cacheable=true)
    public static List<Certificates__c> getCertificates() {
        return [SELECT Name, Credential_ID__c, Issue_date__c, Image_File_Name__c FROM Certificates__c
        ORDER BY CreatedDate ASC];  
    }
}