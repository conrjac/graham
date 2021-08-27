public class UsageExamples {
 
    public static void UpdateContactWithPhoneNumberInCorrectField(Id contactId, String phoneNumber)
    {
        //  Given a phone number and contact Id as an input, determine the telephone number type to then susequently choose the field on the Contact record to store the number in.
        PhoneNumberType pnt = new PhoneNumberType(phoneNumber);

        Contact c = new Contact(Id = contactId);

        If(pnt.numberTypeAsString == 'MOBILE')
        {
            c.MobilePhone = pnt.numberAsStringUnformatted;
        }
        Else If(pnt.numberTypeAsString == 'GEOGRAPHIC')
        {
            c.Phone = pnt.numberAsStringUnformatted;
        }

        Update c;

    }

}
