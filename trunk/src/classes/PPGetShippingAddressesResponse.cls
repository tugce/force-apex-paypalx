global class PPGetShippingAddressesResponse extends PPResponse{
	
	//Get Shipping Addresses
	
	global String CountryCode {get; set;}	
	global String City {get; set;}
	global String Line1 {get; set;}
	global String Line2 {get; set;}
	global String PostalCode {get; set;}
	global String State {get; set;}
	global String AddressType {get; set;}
	global String AddressName {get; set;}
	global String AddressId {get; set;}
	
	global PPGetShippingAddressesResponse() {
		
	}
	
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	
    	try{
    		
    		super.parseCommonParams(Parameters);
    		
    		String tagSelectedAddress = 'selectedAddress';
    		String tagBaseAddress = tagSelectedAddress + PPStaticRes.DOT + 'baseAddress';
    		
    		String tagAddressName =  tagSelectedAddress + PPStaticRes.ADDRESS_NAME;    		
    		if (parameters.containsKey(tagAddressName))
		 		AddressName = parameters.remove(tagAddressName);
    		
    		String tagAddressId =  tagSelectedAddress + PPStaticRes.ADDRESS_ID;    		
    		if (parameters.containsKey(tagAddressId))
		 		AddressId = parameters.remove(tagAddressId);    		
    		
    		String tagLine1 =  tagBaseAddress + PPStaticRes.LINE1;    		
    		if (parameters.containsKey(tagLine1))
		 		Line1 = parameters.remove(tagLine1);    		
    		
    		String tagLine2 =  tagBaseAddress + PPStaticRes.LINE2;    		
    		if (parameters.containsKey(tagLine2))
		 		Line2 = parameters.remove(tagLine2);

    		String tagCity =  tagBaseAddress + PPStaticRes.CITY;    		
    		if (parameters.containsKey(tagCity))
		 		City = parameters.remove(tagCity);  		 		

    		String tagCountryCode =  tagBaseAddress + PPStaticRes.COUNTRY_CODE;    		
    		if (parameters.containsKey(tagCountryCode))
		 		CountryCode = parameters.remove(tagCountryCode);  		 		

    		String tagPostalCode =  tagBaseAddress + PPStaticRes.POSTAL_CODE;    		
    		if (parameters.containsKey(tagPostalCode))
		 		PostalCode = parameters.remove(tagPostalCode); 

    		String tagState =  tagBaseAddress + PPStaticRes.STATE;    		
    		if (parameters.containsKey(tagState))
		 		State = parameters.remove(tagState);   		 		

    		String tagAddressType =  tagBaseAddress + PPStaticRes.ADDRESS_TYPE;    		
    		if (parameters.containsKey(tagAddressType))
		 		AddressType = parameters.remove(tagAddressType);		 	
		 		    		
    		
    	}catch(System.Exception e){    		
    		System.Debug(Logginglevel.ERROR, 'PPGetShippingAddressesResponse:parseResponseParameters() : ' + e);    		
    	}
    }
    
      	
	
}