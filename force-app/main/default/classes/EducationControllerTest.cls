@isTest
private class EducationControllerTest {

    @isTest
    static void testGetEducations() {
        // Create test data
        List<Education__c> educations = new List<Education__c>{
            new Education__c(
                Education_Name__c = 'Bachelor of Science',
                Education_Description__c = 'Computer Science Program',
                Date__c = String.valueOf(Date.today().addYears(-4)),
                Degree__c = 'BSc',
                Location__c = 'University of Testville',
                Image_File_Name__c = 'bsc.png'
            ),
            new Education__c(
                Education_Name__c = 'Master of Science',
                Education_Description__c = 'Data Science Program',
                Date__c = String.valueOf(Date.today().addYears(-2)),
                Degree__c = 'MSc',
                Location__c = 'Institute of AI',
                Image_File_Name__c = 'msc.png'
            )
        };

        insert educations;

        // Call the method
        Test.startTest();
        List<Education__c> results = EducationController.getEducations();
        Test.stopTest();

        // Assert the results
        System.assertEquals(2, results.size(), 'Should return 2 education records');
        System.assertEquals('Bachelor of Science', results[0].Education_Name__c);
        System.assertEquals('Master of Science', results[1].Education_Name__c);
    }
}