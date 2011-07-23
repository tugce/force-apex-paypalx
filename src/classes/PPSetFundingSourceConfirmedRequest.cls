global class PPSetFundingSourceConfirmedRequest extends PPRequest{

	global String AccountId {get;set;}
	global String EmailAddress {get;set;}
	global String FundingSourceKey {get;set;}
	
	global String SandboxEmailAddress {get; set;}	
	
	public PPSetFundingSourceConfirmedRequest(String CommonRequestParametersObjectName){		
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);        
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);				
		ApiName = PPStaticRes.SET_FUNDING_SRC_CONFIRMED_API;
		
		AccountId = '';
		EmailAddress = '';
		FundingSourceKey = '';		
	}
	
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}	
	
	public override void getRequestParams(Map<String, String> requestParams) {
	
		if (Null != requestParams) {
			
			super.setCommonRequestParams(requestParams);
			
			if (Null != EmailAddress && 0 != EmailAddress.length())		
    			requestParams.put('emailAddress', EmailAddress);

			if (Null != AccountId && 0 != AccountId.length())		
    			requestParams.put('accountId', AccountId);
    			
			if (Null != FundingSourceKey && 0 != FundingSourceKey.length())		
    			requestParams.put('fundingSourceKey', FundingSourceKey); 
    			
    		if(Null != SandboxEmailAddress && 0!= SandboxEmailAddress.length() ){
    			requestParams.put(PPStaticRes.SANDBOX_EMAIL_ADDRESS, SandboxEmailAddress);
    		}
    			   			
    										
		}
				
	}
	
}