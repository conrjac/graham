@isTest
private class PhoneNumberTypeTest {
  
  @isTest static void testConstructorSimple() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType('01945123456');
    
    System.assertNotEquals(NULL, pnt, 'Phone Number Type failed to create');
    
    Test.stopTest();
  }
  
  @isTest static void testConstructorSimpleFailures() {
    
    Test.startTest();
    
    try{
      PhoneNumberType pnt = new PhoneNumberType('012345678910111213141516');
    }
    catch(Exception e)
    {
      System.assertEquals('PhoneNumberException', e.getTypeName(), 'Exception thrown is not a PhoneNumberException');
    }
    
    try{
      PhoneNumberType pnt = new PhoneNumberType('012');
    }
    catch(Exception e)
    {
      System.assertEquals('PhoneNumberException', e.getTypeName(), 'Exception thrown is not a PhoneNumberException');
    }
    
    Test.stopTest();
  }

  @isTest static void testConstructorWithInternational() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType('+441945123456');
    
    System.assertEquals(pnt.numberAsStringUnformatted, '01945123456', 'Unformatted Phone Number not as expected');
    
    Test.stopTest();
  }

  @isTest static void testConstructorWithNoZero() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType('1945123456');
    
    System.assertEquals(pnt.numberAsStringUnformatted, '01945123456', 'Unformatted Phone Number not as expected');
    
    Test.stopTest();
  }
  
  @isTest static void testFirstTwoDigits() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType('01945123456');
    string firstTwoDigits = pnt.firstTwoDigits;
    
    System.assertEquals('01', firstTwoDigits, 'firstTwoDigits not as expected');
    
    Test.stopTest();
  }
  
  @isTest static void testNumberofDigits() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType('012345689');
    
    System.assertEquals(9, pnt.numberOfDigits, 'Number of Digits not as expected');
    
    Test.stopTest();
  }

  @isTest static void testNumberAsStringUnformatted() {
    Test.startTest();
    
    PhoneNumberType pnt = new PhoneNumberType(' 01945 12345-6');
    System.assertEquals('01945123456', pnt.numberAsStringUnformatted, 'Unformatted number not as expected');
    
    Test.stopTest();
  }

  @isTest static void testGeographicNumberEnumAndAsString()
  {
    Test.startTest();
    PhoneNumberType pnt = new PhoneNumberType(' 01945 12345-6');
    Test.stopTest();
    
    System.assertEquals(PhoneNumberType.SERVICETYPE.GEOGRAPHIC, pnt.numberType, 'Service Type not as expected');
    System.assertEquals('GEOGRAPHIC', pnt.numberTypeAsString, 'Service Type not as expected');
    
  }
  
  @isTest static void testPremiumNumberEnumAndAsString()
  {
    Test.startTest();
    PhoneNumberType pnt = new PhoneNumberType(' 0999 333 444 2');
    Test.stopTest();
    
    System.assertEquals(PhoneNumberType.SERVICETYPE.PREMIUM, pnt.numberType, 'Service Type not as expected');
    System.assertEquals('PREMIUM', pnt.numberTypeAsString, 'Service Type not as expected');
    
  }
  
}
