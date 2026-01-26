public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactDetails() {
        return [SELECT Email, FirstName, LastName, HomePhone, Phone, MailingCity, MailingCountry, MailingStreet, MailingPostalCode FROM Contact WHERE Id = '003Qy00000MQN17IAH'];
    }
}