@isTest
private class PhoneNumberTypeTest {

    
  // Methods for testing
   @isTest static void testConstructorSimple() {
       Test.startTest();
        
       PhoneNumberType pnt = new PhoneNumberType('01945123456');

        Test.stopTest();
   }

  @isTest static void testConstructorWithInternational() {
       Test.startTest();
        
       PhoneNumberType pnt = new PhoneNumberType('+441945123456');

        system.assertEquals(pnt.numberAsStringUnformatted, '01945123456', 'Unformatted Phone Number not as expected');

        Test.stopTest();
   }

     @isTest static void testConstructorWithNoZero() {
       Test.startTest();
        
       PhoneNumberType pnt = new PhoneNumberType('1945123456');

        system.assertEquals(pnt.numberAsStringUnformatted, '01945123456', 'Unformatted Phone Number not as expected');

        Test.stopTest();
   }

     @isTest static void testFirstTwoDigits() {
        Test.startTest();
        
        PhoneNumberType pnt = new PhoneNumberType('01945123456');
        string firstTwoDigits = pnt.firstTwoDigits;

        system.assertEquals('01', firstTwoDigits, 'firstTwoDigits not as expected');

        Test.stopTest();
   }


     @isTest static void testNumberAsStringUnformatted() {
        Test.startTest();
        
        PhoneNumberType pnt = new PhoneNumberType(' 01945 12345-6');
        system.assertEquals('01945123456', pnt.numberAsStringUnformatted, 'Unformatted number not as expected');

        Test.stopTest();
   }




}