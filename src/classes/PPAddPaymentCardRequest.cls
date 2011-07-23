global class PPAddPaymentCardRequest extends PPRequest {
		
	global String SandboxEmailAddress {get; set;}
	
	global String AccountId {get; set;}
	
	global PPAddress BillingAddress {get; set;}
	
	global String CardNumber {get; set;}
	
	global Date	CardOwnerDateOfBirth {get; set;}
	
	global String CardType {get; set;}
	
	global String CardVerificationNumber {get; set;}
	
	global String ConfirmationType {get; set;}
	
	global String CreateAccountKey {get; set;}
	
	global String EmailAddress {get; set;}
	
	global Integer ExpirationDateMonth {get; set;}
	
	global Integer ExpirationDateYear {get; set;}
	
	global String IssueNumber {get; set;}	
	
	global PPName NameOnCard{get; set;}
	
	global Integer StartDateMonth{get; set;}
	
	global Integer StartDateYear{get; set;}
	
	global PPWebOptions WebOptions{get; set;}
	
		
	global PPAddPaymentCardRequest(String CommonRequestParametersObjectName){

    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);        
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
		
		ApiName = PPStaticRes.ADD_PAYMENT_CARD_API;
		
		AccountId = '';
		BillingAddress = new PPAddress();	
		CardNumber = '';
		//CardOwnerDateOfBirth
		CardType = '';	
		CardVerificationNumber  = '';	
		ConfirmationType = '';	
		CreateAccountKey = '';			
		EmailAddress = '';	
		ExpirationDateMonth = 0;
		ExpirationDateYear = 0;	
		IssueNumber  = '';	
		NameOnCard = new PPName();	
		StartDateMonth = 0;	
		StartDateYear=0;	
		WebOptions = new PPWebOptions();
		
		SandboxEmailAddress = '';
	}

	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
				
		if (Null != requestParams) {
						
			super.setCommonRequestParams(requestParams);

			if (Null != AccountId && 0 != AccountId.length())		
    			requestParams.put('accountId', AccountId);

			if(BillingAddress != null){
				
				if (Null != BillingAddress.Line1 && 0 != BillingAddress.Line1.length())		
    				requestParams.put('billingAddress.line1', BillingAddress.Line1);

				if (Null != BillingAddress.Line2 && 0 != BillingAddress.Line2.length())		
    				requestParams.put('billingAddress.line2', BillingAddress.Line2);
    				
				if (Null != BillingAddress.City && 0 != BillingAddress.City.length())		
    				requestParams.put('billingAddress.city', BillingAddress.City); 

				if (Null != BillingAddress.State && 0 != BillingAddress.State.length())		
    				requestParams.put('billingAddress.state', BillingAddress.State);
    				
				if (Null != BillingAddress.PostalCode && 0 != BillingAddress.PostalCode.length())		
    				requestParams.put('billingAddress.postalCode', BillingAddress.PostalCode);

				if (Null != BillingAddress.CountryCode && 0 != BillingAddress.CountryCode.length())		
    				requestParams.put('billingAddress.countryCode', BillingAddress.CountryCode);    				   				
					
			}
			
			
			if (Null != CardNumber && 0 != CardNumber.length())		
    			requestParams.put('cardNumber', CardNumber);

			if (Null != CardType && 0 != CardType.length())		
    			requestParams.put('cardType', CardType);
    			
			if (Null != CardVerificationNumber && 0 != CardVerificationNumber.length())		
    			requestParams.put('cardVerificationNumber', CardVerificationNumber);
    			
			if (Null != ConfirmationType && 0 != ConfirmationType.length())		
    			requestParams.put('confirmationType', ConfirmationType);    			   			
    			    						
			if (Null != CreateAccountKey && 0 != CreateAccountKey.length())		
    			requestParams.put('createAccountKey', CreateAccountKey);

			if (Null != EmailAddress && 0 != EmailAddress.length()){
				requestParams.put('emailAddress', EmailAddress);
				System.debug('****Adding email address=>' + EmailAddress);
			}		
    			
    			
			if (Null != ExpirationDateMonth && 0 != ExpirationDateMonth)		
    			requestParams.put('expirationDate.month', String.valueOf(ExpirationDateMonth));

			if (Null != ExpirationDateYear && 0 != ExpirationDateYear)		
    			requestParams.put('expirationDate.year', String.valueOf(ExpirationDateYear));
    			
			if (Null != IssueNumber && 0 != IssueNumber.length())		
    			requestParams.put('issueNumber', IssueNumber);     			
    			
			if (Null != NameOnCard){
								
				if(Null != NameOnCard.FirstName && 0 != NameOnCard.FirstName.length()){
					requestParams.put('nameOnCard.firstName', NameOnCard.FirstName);  
				}

				if(Null != NameOnCard.LastName && 0 != NameOnCard.LastName.length()){
					requestParams.put('nameOnCard.lastName', NameOnCard.LastName);  
				}

				if(Null != NameOnCard.Salutation && 0 != NameOnCard.Salutation.length()){
					requestParams.put('nameOnCard.salutation', NameOnCard.Salutation);  
				}

				if(Null != NameOnCard.Suffix && 0 != NameOnCard.Suffix.length()){
					requestParams.put('nameOnCard.suffix', NameOnCard.Suffix);  
				}
				
			}
			
			if (Null != StartDateMonth && 0 != StartDateMonth)		
    			requestParams.put('startDate.month', String.valueOf(StartDateMonth));

			if (Null != StartDateYear && 0 != StartDateYear)		
    			requestParams.put('startDate.year', String.valueOf(StartDateYear));
					
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