public with sharing class EducationController {
    @AuraEnabled(cacheable=true)
    public static List<Education__c> getEducations() {
        return [SELECT Education_Name__c, Education_Description__c, Date__c, Degree__c, Location__c, Image_File_Name__c
        FROM Education__c
        ORDER BY CreatedDate ASC];  
    }
}