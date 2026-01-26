@isTest
private class CertificatesControllerTest {

    @isTest
    static void testGetCertificates() {
        // Create test data
        List<Certificates__c> certList = new List<Certificates__c>{
            new Certificates__c(
                Name = 'Salesforce Admin',
                Credential_ID__c = 'ADM-1234',
                Issue_date__c = String.valueOf(Date.today().addYears(-2)),
                Image_File_Name__c = 'admin_cert.png'
            ),
            new Certificates__c(
                Name = 'Salesforce Developer',
                Credential_ID__c = 'DEV-5678',
                Issue_date__c = String.valueOf(Date.today().addYears(-1)),
                Image_File_Name__c = 'dev_cert.png'
            )
        };

        insert certList;

        // Call the controller method
        Test.startTest();
        List<Certificates__c> results = CertificatesController.getCertificates();
        Test.stopTest();

        // Assert results
        System.assertEquals(2, results.size(), 'Should return 2 certificates');
        System.assertEquals('Salesforce Admin', results[0].Name);
        System.assertEquals('Salesforce Developer', results[1].Name);
    }
}
