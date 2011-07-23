global class PPGetPaymentOptionsRequest extends PPRequest {
	
	global String PayKey {get;set;}
		
	global PPGetPaymentOptionsRequest(String CommonRequestParametersObjectName) {

    	ApiName = PPStaticRes.GET_PAYMENT_OPTIONS_API;
    	
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);						
		PayKey = '';
		
	}
	
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
		
	public override void getRequestParams(Map<String, String> requestParams) {
		
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			
			if (Null != PayKey && 0 != PayKey.length())		
    			requestParams.put(PPStaticRes.PAY_KEY, PayKey);
    			
		}				
	}
	
}