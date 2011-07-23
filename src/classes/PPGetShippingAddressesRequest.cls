global class PPGetShippingAddressesRequest extends PPRequest{

	global String Key {get;set;}
	
	global PPGetShippingAddressesRequest(String CommonRequestParametersObjectName) {
    	ApiName = PPStaticRes.GET_SHIPPING_ADDRESSES_API;    	
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);						
		Key = '';		
	}	

	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			
			if (Null != Key && 0 != Key.length())		
    			requestParams.put(PPStaticRes.KEY, Key);    			
		}				
	}


}