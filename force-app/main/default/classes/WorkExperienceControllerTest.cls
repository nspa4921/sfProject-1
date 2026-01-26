@isTest
private class WorkExperienceControllerTest {

    @isTest
    static void testGetWorkExperiences() {
        // Create test data
        List<Work_Experience__c> workList = new List<Work_Experience__c>{
            new Work_Experience__c(
                Title__c = 'Salesforce Developer',
                Company__c = 'TechCorp',
                Start_Date__c = Date.newInstance(2021, 1, 1),
                End_Date__c = Date.newInstance(2023, 12, 31),
                Image_File_Name__c = 'dev.png',
                Description__c = 'Worked on Salesforce integrations',
                Is_Expanded__c = true,
                Show_Description__c = true,
                Icon_Name__c = 'utility:code_playground',
                Icon_Title__c = 'Developer Icon',
                Location__c = 'Copenhagen',
                Technologies__c = 'Apex, LWC, Flow'
            ),
            new Work_Experience__c(
                Title__c = 'Frontend Engineer',
                Company__c = 'WebWorks',
                Start_Date__c = Date.newInstance(2018, 5, 1),
                End_Date__c = null, // Ongoing role
                Image_File_Name__c = 'frontend.png',
                Description__c = 'Developed UI components',
                Is_Expanded__c = false,
                Show_Description__c = false,
                Icon_Name__c = 'utility:brush',
                Icon_Title__c = 'Frontend Icon',
                Location__c = 'Aarhus',
                Technologies__c = 'HTML, CSS, JS'
            )
        };

        insert workList;

        // Call the controller method
        Test.startTest();
        List<Work_Experience__c> results = WorkExperienceController.getWorkExperiences();
        Test.stopTest();

        // Assertions
        System.assertEquals(2, results.size(), 'Should return 2 work experiences');
        System.assertNotEquals(null, results[0].Id, 'Record should have an Id');
        System.assert(results[0].Title__c != null, 'Title should not be null');
    }
}
