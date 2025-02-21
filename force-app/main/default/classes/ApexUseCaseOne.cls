public class ApexUseCaseOne {
  public static void createNewContact(
    String firstName,
    String lastName,
    String emailAddress
  ) {
    List<Contact> conListToInsert = new List<Contact>();

    Contact conToInsert = new Contact();
    if (!String.isBlank(lastName)) {
      conToInsert.FirstName = firstName;
      conToInsert.LastName = lastName;
      conToInsert.Email = emailAddress;
      conListToInsert.add(conToInsert);
    }

    if (conListToInsert.size() > 0) {
      insert conListToInsert;
    }
  }
}