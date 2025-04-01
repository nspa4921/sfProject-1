trigger FormSubmissionTrigger on Form_Submission__c (after insert) {
    for(Form_Submission__c submission : Trigger.new) {
        // Invoke the Apex method with data from the custom object
            ApexUseCaseOne.createNewContact(
            submission.First_Name__c,
            submission.Last_Name__c,
            submission.Email__c
        );
    }
}