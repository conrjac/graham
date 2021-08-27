public with sharing class PhoneNumberType {
    
    public enum SERVICETYPE{INTERNATIONAL, GEOGRAPHIC, NONGEOGRAPHIC, RESERVED, CORPORTATEVOIP, MOBILE, FREEPHONE, PREMIUM, INVALID}
    
    public integer numberAsInteger;
    public string numberAsStringUnformatted;
    public string numberAsStringFormatted;
    public integer numberOfDigits
    {
        get { 
            return numberAsStringUnformatted.length();
        }
    }
    
    public string firstTwoDigits
    {
        get{
            return numberAsStringUnformatted.left(2);
        }
    }
    
    public SERVICETYPE numberType{
        get{ 
            return SERVICETYPE.INTERNATIONAL;
        }
    }

    
    
    
    public PhoneNumberType(string input) {
        numberAsStringUnformatted = input.replaceAll('[^0-9]', '');

        if((numberAsStringUnformatted.length() > 12) && (numberAsStringUnformatted.length() < 5))
        {
            throw new PhoneNumberException('Phone Number input length should be between 5 and 15 digits');
        }

        if(numberAsStringUnformatted.left(2) == '44')
        {
            // number is in international format
            numberAsStringUnformatted = '0' + numberAsStringUnformatted.removeStart('44');
        }

        if(numberAsStringUnformatted.left(1) != '0')
        {
            numberAsStringUnformatted = '0' + numberAsStringUnformatted;
        }

    }

}