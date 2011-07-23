global class PPAddBankAccountRequest extends PPRequest {

	global String SandboxEmailAddress {get; set;}
	
	global String EmailAddress {get; set;}

	global String AccountId {get; set;}
	
	global String CreateAccountKey {get; set;}
	
	global String BankCountryCode {get; set;}

	global String BankName {get; set;}
	
	global String RoutingNumber {get; set;}
	
	global String BankAccountType {get; set;}
	
	global String BankAccountNumber {get; set;}
	
	global String Iban {get; set;}
	
	global String Clabe {get; set;}
	
	global String BsbNumber {get; set;}
	
	global String BranchLocation {get; set;}
	
	global String SortCode {get; set;}
	
	global String BankTransitNumber {get; set;}
	
	global String InstitutionNumber {get; set;}
	
	global String BranchCode {get; set;}
	
	global String AgencyNumber {get; set;}
	
	global String BankCode {get; set;}
	
	global String RibKey {get; set;}
	
	global String ControlDigit {get; set;}
	
	global String TaxIdType {get; set;}
	
	global String TaxIdNumber {get; set;}
	
	//global Date AccountHolderDateOfBirth {get; set;}
	
	global String ConfirmationType {get; set;}
	
	global PPWebOptions WebOptions {get; set;}	
	
	
	public PPAddBankAccountRequest(String CommonRequestParametersObjectName){
		
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);        
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
				
		ApiName = PPStaticRes.ADD_BANK_ACCOUNT_API;
		
		EmailAddress = '';
		AccountId = '';	
		CreateAccountKey = '';	
		BankCountryCode = '';
		BankName = '';	
		RoutingNumber = '';	
		BankAccountType = '';	
		BankAccountNumber = '';	
		Iban = '';	
		Clabe = '';		
		BsbNumber = '';	
		BranchLocation = '';	
		SortCode = '';	
		BankTransitNumber = '';	
		InstitutionNumber = '';	
		BranchCode = '';	
		AgencyNumber = '';	
		BankCode = '';	
		RibKey = '';
		ControlDigit = '';	
		TaxIdType = '';
		TaxIdNumber = '';
		ConfirmationType = '';
		WebOptions =  new PPWebOptions();			
		//AccountHolderDateOfBirth = new Date('01-01-1950');
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
    			
			if (Null != CreateAccountKey && 0 != CreateAccountKey.length())		
    			requestParams.put('createAccountKey', CreateAccountKey);    			

			if (Null != BankCountryCode && 0 != BankCountryCode.length())		
    			requestParams.put('bankCountryCode', BankCountryCode);
    			
    		if (Null != BankName && 0 != BankName.length())		
    			requestParams.put('bankName', BankName);	 			

    		if (Null != RoutingNumber && 0 != RoutingNumber.length())		
    			requestParams.put('routingNumber', RoutingNumber);	

    		if (Null != BankAccountType && 0 != BankAccountType.length())		
    			requestParams.put('bankAccountType', BankAccountType);
    			
    		if (Null != BankAccountNumber && 0 != BankAccountNumber.length())		
    			requestParams.put('bankAccountNumber', BankAccountNumber);	

    		if (Null != Iban && 0 != Iban.length())		
    			requestParams.put('iban', Iban);	

    		if (Null != Clabe && 0 != Clabe.length())		
    			requestParams.put('clabe', Clabe);	

    		if (Null != BsbNumber && 0 != BsbNumber.length())		
    			requestParams.put('bsbNumber', BsbNumber);	
 		
    		if (Null != BranchLocation && 0 != BranchLocation.length())		
    			requestParams.put('branchLocation', BranchLocation);	

    		if (Null != SortCode && 0 != SortCode.length())		
    			requestParams.put('sortCode', SortCode);	

    		if (Null != BankTransitNumber && 0 != BankTransitNumber.length())		
    			requestParams.put('sortCode', SortCode);	

    		if (Null != InstitutionNumber && 0 != InstitutionNumber.length())		
    			requestParams.put('institutionNumber', InstitutionNumber);	

    		if (Null != BranchCode && 0 != BranchCode.length())		
    			requestParams.put('branchCode', BranchCode);	

    		if (Null != AgencyNumber && 0 != AgencyNumber.length())		
    			requestParams.put('agencyNumber', AgencyNumber);	

    		if (Null != BankCode && 0 != BankCode.length())		
    			requestParams.put('bankCode', BankCode);	

    		if (Null != RibKey && 0 != RibKey.length())		
    			requestParams.put('ribKey', RibKey);	

    		if (Null != ControlDigit && 0 != ControlDigit.length())		
    			requestParams.put('controlDigit', ControlDigit);	

    		if (Null != TaxIdType && 0 != TaxIdType.length())		
    			requestParams.put('taxIdType', TaxIdType);	

    		if (Null != TaxIdNumber && 0 != TaxIdNumber.length())		
    			requestParams.put('taxIdNumber', TaxIdNumber);	

    		if (Null != ConfirmationType && 0 != ConfirmationType.length())		
    			requestParams.put('confirmationType', ConfirmationType);	

    		if(Null != WebOptions){

				if(Null != WebOptions.CancelUrl && 0 != WebOptions.CancelUrl.length()){
					requestParams.put('webOptions.cancelUrl', WebOptions.CancelUrl);  
				}
    			
				if(Null != WebOptions.ReturnUrl && 0 != WebOptions.ReturnUrl.length()){
					requestParams.put('webOptions.returnUrl', WebOptions.ReturnUrl);  
				}
    			
				if(Null != WebOptions.ReturnUrlDescription && 0 != WebOptions.ReturnUrlDescription.length()){
					requestParams.put('webOptions.returnUrlDescription', WebOptions.ReturnUrlDescription);  
				}
				
				if(Null != WebOptions.CancelUrlDescription && 0 != WebOptions.CancelUrlDescription.length()){
					requestParams.put('webOptions.cancelUrlDescription', WebOptions.CancelUrlDescription);  
				}
				    			
    		}
    		
    		if(Null != SandboxEmailAddress && 0!= SandboxEmailAddress.length() ){
    			requestParams.put(PPStaticRes.SANDBOX_EMAIL_ADDRESS, SandboxEmailAddress);
    		}
    		
			
		}		
		
	}	
	
}