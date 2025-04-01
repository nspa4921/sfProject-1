public with sharing class WorkExperienceController {
    @AuraEnabled(cacheable=true)
    public static List<Work_Experience__c> getWorkExperiences() {
        return [SELECT Id, Title__c, Company__c, Start_Date__c, End_Date__c, Technologies_Used__c FROM Work_Experience__c];
    }
}
