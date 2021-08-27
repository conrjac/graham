public with sharing class PhoneNumberType {
    
    public enum SERVICETYPE{INTERNATIONAL, GEOGRAPHIC, NONGEOGRAPHIC, RESERVED, CORPORTATEVOIP, MOBILE, FREEPHONE, PREMIUM, INVALID}
    
    public integer numberAsInteger 
    {
        get { 
            return integer.valueof(numberAsStringUnformatted); 
        }
    }
    public string numberAsStringUnformatted;
    public string numberAsStringFormatted;
    public Boolean isValid;

    public integer numberOfDigits
    {
        get { 
            return numberAsStringUnformatted.length();
        }
    }
    
    public string numberTypeAsString{
        get {
           return numberType.name();
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
            switch on firstTwoDigits {
                when '00' {
                    return SERVICETYPE.INTERNATIONAL;
                }	
                when '01','02' {
                    return SERVICETYPE.GEOGRAPHIC;
                }
                when '03' {
                    return SERVICETYPE.NONGEOGRAPHIC;
                }
                when '04', '06' {
                    return SERVICETYPE.RESERVED;
                }
                when '05' {
                    return SERVICETYPE.CORPORTATEVOIP;
                }
                when '07' {
                    return SERVICETYPE.MOBILE;
                }
                when '08' {
                    return SERVICETYPE.FREEPHONE;
                }
                when '09' {
                    return SERVICETYPE.PREMIUM;
                }
                when else {		  
                    return SERVICETYPE.INVALID;
                }
            }
        }
    }
    
    public PhoneNumberType(string input) {
        numberAsStringUnformatted = input.replaceAll('[^0-9]', '');
        
        if((numberAsStringUnformatted.length() > 12) || (numberAsStringUnformatted.length() < 5))
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
            // if the inputted number is not prefixed with 0, then prefix with 0
            numberAsStringUnformatted = '0' + numberAsStringUnformatted;
        }
    }
    
}