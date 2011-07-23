global class PPGetVerifiedStatusRequest extends PPRequest{
	
	global String EmailAddress {get;set;}
	global String FirstName {get;set;}
	global String LastName {get;set;}
	global String MatchCriteria {get;set;}
	
	global String SandboxEmailAddress {get;set;}
	
		
	global PPGetVerifiedStatusRequest(String CommonRequestParametersObjectName) {
    	ApiName = PPStaticRes.GET_VERIFIED_STATUS_API;    	
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);		
	}	

	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}

	public override void getRequestParams(Map<String, String> requestParams) {
				
		if (Null != requestParams) {

			super.setCommonRequestParams(requestParams);			
			
			if (Null != EmailAddress && 0 != EmailAddress.length())		
    			requestParams.put('emailAddress', EmailAddress);

			if (Null != FirstName && 0 != FirstName.length())		
    			requestParams.put('firstName', FirstName);

			if (Null != LastName && 0 != LastName.length())		
    			requestParams.put('lastName', LastName);

			if (Null != MatchCriteria && 0 != MatchCriteria.length())		
    			requestParams.put('matchCriteria', MatchCriteria);  

			if (Null != SandboxEmailAddress && 0 != SandboxEmailAddress.length())		
    			requestParams.put('sandboxEmailAddress', SandboxEmailAddress);  
    			  			  			
		}				
	}	

}