global class PPAddPaymentCardResponse extends PPResponse{

	global String ExecStatus {get; set;}
	
	global String RedirectURL {get; set;}
	
	global String FundingSourceKey {get; set;}

	global PPAddPaymentCardResponse() {
		ExecStatus = '';
		RedirectURL = '';
		FundingSourceKey = '';
	}
	
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
	public override void parseResponseParameters(Map<String, String> parameters) {
    	super.parseCommonParams(Parameters);
    	
		String tagExecStatus = 'execStatus';		
		if (parameters.containsKey(tagExecStatus))
	 		ExecStatus = parameters.remove(tagExecStatus);
    	
		String tagRedirectURL = 'redirectURL';		
		if (parameters.containsKey(tagRedirectURL))
	 		RedirectURL = parameters.remove(tagRedirectURL);
	 		
		String tagFundingSourceKey = 'fundingSourceKey';		
		if (parameters.containsKey(tagFundingSourceKey))
	 		FundingSourceKey = parameters.remove(tagFundingSourceKey);
    	
	}

}