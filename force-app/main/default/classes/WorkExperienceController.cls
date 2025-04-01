public with sharing class WorkExperienceController {
    @AuraEnabled(cacheable=true)
    public static List<Work_Experience__c> getWorkExperiences() {
        return [SELECT Id, Title__c, Company__c, Start_Date__c, End_Date__c, Image_File_Name__c,
        Description__c, Is_Expanded__c, Show_Description__c, Icon_Name__c, Icon_Title__c, location__c, Technologies__c
        FROM Work_Experience__c
        ORDER BY End_Date__c DESC NULLS LAST];  
    }
}