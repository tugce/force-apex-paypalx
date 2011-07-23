global class PPAdaptiveToolkit {

    // (Required) Stores the http request headers and PayPal API credentials
    // needed for sending request to PayPal.
    global PPBaseAPIProfile BaseAPIProfile {get; set;}
    
    // Constructor
    global PPAdaptiveToolkit() {
        BaseAPIProfile = new PPBaseAPIProfile();
    }
    
    // Constructor w/ Credential & Service to set BaseAPI Profile
    global PPAdaptiveToolkit(String APICredentialObjectName) {
        // set the Base Profile info - API Credentials, Application Id and Environment
        BaseAPIProfile = new PPBaseAPIProfile(APICredentialObjectName);
    }

    // pay API provides facility to transfer funds from a sender's PayPal account  
    // to one or more receivers' PayPal accounts. One can use the Pay API to make 
    // simple payments, chained payments or parallel payments. These payments can
    // be explicitly approved, preapproved or implicitly approved.
    global PPPayResponse pay(PPPayRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPPayResponse response = new PPPayResponse();
        executeCommand(request, response);
        return response;
    }
    
    // The executePayment method lets you execute a payment setup with the Pay method with the actionType 
    // CREATE or PAY_PRIMARY (delayed payments)
    global PPExecutePaymentResponse executePayment(PPExecutePaymentRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPExecutePaymentResponse response = new PPExecutePaymentResponse();
        executeCommand(request, response);
        return response;
    }
    
	// commitPayment API provides facility to logon and approve a payment.
    global PageReference commitPayment(String payKey) {
        PageReference payPalPage = new PageReference(BaseAPIProfile.getPayPalLoginPage() +  PAYMENT_COMMAND_STRING + payKey);
        payPalPage.setRedirect(true);
        return payPalPage;
    }
    
    // paymentDetails API provides facility to obtain information about a payment. One
	// can identify the payment by tracking ID, the PayPal transaction ID or the pay
	// key associated with the payment.
    global PPPaymentDetailsResponse paymentDetails(PPPaymentDetailsRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPPaymentDetailsResponse response = new PPPaymentDetailsResponse();
        executeCommand(request, response);
        return response;
    }
    
	// preapproval API allows setting up an agreement between Merchant and a sender
	// for making payments on the sender's behalf. One can setup a preapproval for
	// a specific maximum amount over a specific period of time and optionally by 
	// any of the following constraints: the number of payments, a maximum per-payment  
	// amount, a specific day of the week or the month, and whether or not a PIN is 
	// required for each payment request.    
	global PPPreapprovalResponse preapproval(PPPreapprovalRequest request) {
		// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPPreapprovalResponse response = new PPPreapprovalResponse();
        executeCommand(request, response);
        return response;
    }
    
    // commitPreapproval API provides facility to logon and setup a preapproval.
    global PageReference commitPreapproval(String preapprovalKey) {
        PageReference payPalPage = new PageReference(BaseAPIProfile.getPayPalLoginPage() + PREAPPROVAL_COMMAND_STRING + preapprovalKey);
        payPalPage.setRedirect(true);
        return payPalPage;
    }

    // preapprovalDetails API provides facility to obtain information about an agreement
	// between Merchant and a sender for making payments on the sender's behalf.
    global PPPreapprovalDetailsResponse preapprovalDetails(PPPreapprovalDetailsRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPPreapprovalDetailsResponse response = new PPPreapprovalDetailsResponse();
        executeCommand(request, response);
        return response;
    }
    
    // cancelPreapproval API facilitates to cancel a agreement between Merchant and
    // sender for making payments on the sender's behalf.
    global PPCancelPreapprovalResponse cancelPreapproval(PPCancelPreapprovalRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPCancelPreapprovalResponse response = new PPCancelPreapprovalResponse();
        executeCommand(request, response);
        return response;
    }

    // refund API provides facility to refund all or part of a payment. One can 
    // specify the amount of the refund and identify the accounts to receive the 
    // refund by the payment key or tracking ID and optionally, by transaction ID 
    // or the receivers of the original payment.
    global PPRefundResponse refund(PPRefundRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPRefundResponse response = new PPRefundResponse();
        executeCommand(request, response);
        return response;
    }

	// convertCurrency_PP API lets your application request the current foreign exchange (FX) rate
	// for a specific amount and currency
    global PPConvertCurrencyResponse convertCurrency_PP(PPConvertCurrencyRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPConvertCurrencyResponse response = new PPConvertCurrencyResponse();
        executeCommand(request, response);
        return response;
    }
    
    // createAccount API enables Merchants to create PayPal accounts. As the
	// application owner, you can enable accounts to be created for your customers 
	// or for customers using your application to access someone else's website or 
	// device.
    global PPCreateAccountResponse createAccount(PPCreateAccountRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPCreateAccountResponse response = new PPCreateAccountResponse();
        executeCommand(request, response);
        return response;
    }
    
    // getUserAgreement API provides facility to request the PayPal's user agreement
	// for the user to approve during account creation.
    global PPGetUserAgreementResponse getUserAgreement(PPGetUserAgreementRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPGetUserAgreementResponse response = new PPGetUserAgreementResponse();
        executeCommand(request, response);
        return response;
    }
    
    private void executeCommand(PPRequest request, PPResponse response) {
    	
        if (Null != request) {
			verifyBaseApiProfile();
			Map<String, String>requestParams = new Map<String, String>();			
			request.getRequestParams(requestParams);

			 // !!! Once SandboxEmailAddress field is moved to request headers this code 
			 // should moved into the BaseAPIProfile.getRequestHeaders() and SandboxEmailAddress 
			 // field should moved into BaseAPIProfile class
	       	if (PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION == BaseAPIProfile.Environment && 
	       	PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT == BaseAPIProfile.AdaptiveService) {
	       		if (requestParams.containsKey(PPStaticRes.SANDBOX_EMAIL_ADDRESS))
	       			requestParams.remove(PPStaticRes.SANDBOX_EMAIL_ADDRESS);
	       	}
	       	
	       	//Newly added code
	       	if (PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX == BaseAPIProfile.Environment && 
	       	PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT == BaseAPIProfile.AdaptiveService) {
	       		if (requestParams.containsKey(PPStaticRes.SANDBOX_EMAIL_ADDRESS)){
	       			String sandboxEmail = requestParams.get(PPStaticRes.SANDBOX_EMAIL_ADDRESS);	       			
	       			BaseAPIProfile.SandboxEmailAddress = sandboxEmail;
	       			System.debug('*****Change After get Setting Sandbox Email Adress = ' + sandboxEmail)	;	
	       		}		
	       	}

	       		       	
	        String requestBody = PPNvpCodec.encode(requestParams);
	        
	        System.debug('***request body=' + requestBody);
	        

	        PPHttpUtil httpUtil = new PPHttpUtil();
	        httpUtil.createHttpRequest(BaseAPIProfile.getEndPoint() + request.ApiName, 'POST', BaseAPIProfile.getRequestHeaders(), requestBody);
	        
	        if(PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE == BaseAPIProfile.APIProfile) {
	        	httpUtil.setCertificate(BaseAPIProfile.Certificate, BaseAPIProfile.CertificatePassword);
	        }
	        
	        HttpResponse httpResponse = httpUtil.execute();
	        
	        System.debug('*****HttpResponse =' + httpResponse);
	        
	        System.debug('*****HttpResponse Body =' + httpResponse.getBody());
	        	        
			response.parseResponseParameters(PPNvpCodec.decode(httpResponse.getBody()));
			
			 System.debug('*****Parsed Response =' + response);
				        
	        if ((true == response.ResponseEnvelope.Ack.equalsIgnoreCase(FAILURE)) || 
	        	 (true == response.ResponseEnvelope.Ack.equalsIgnoreCase(FAILURE_WITH_WARNING))) {
		    	PPFaultMessageException ex = new PPFaultMessageException();
		    	ex.populateWithFaultMessage(PPNvpCodec.decode(httpResponse.getBody()));
		    	throw ex;
	        } 
        } else {
		    PPFaultMessageException ex = new PPFaultMessageException();
		    ex.populateWithCustomError(PPAdaptiveErrors.ERROR_INVALID_INPUT_PARAM, PPAdaptiveErrors.ERROR_STRING_INVALID_INPUT_PARAM);
		    throw ex;
        }
    }

	private void verifyBaseApiProfile() {
		if (PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_UNKNOWN == BaseAPIProfile.APIProfile) {
			PPFaultMessageException ex = new PPFaultMessageException();
		    ex.populateWithCustomError(PPAdaptiveErrors.ERROR_PROFILE_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_PROFILE_TYPE_UNKNOWN);
		    throw ex;
		}
		
		if (PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_UNKNOWN == BaseAPIProfile.Environment) {
			PPFaultMessageException ex = new PPFaultMessageException();
		    ex.populateWithCustomError(PPAdaptiveErrors.ERROR_ENVIRONMENT_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_ENVIRONMENT_TYPE_UNKNOWN);
		    throw ex;
		}
		
		if (PPBaseAPIProfile.ServiceType.SERVICE_TYPE_UNKNOWN == BaseAPIProfile.AdaptiveService) {
			PPFaultMessageException ex = new PPFaultMessageException();
		    ex.populateWithCustomError(PPAdaptiveErrors.ERROR_SERVICE_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_SERVICE_TYPE_UNKNOWN);
		    throw ex;
		}
	}
	
    private static final String FAILURE = 'Failure';
    private static final String FAILURE_WITH_WARNING = 'FailureWithWarning';
    private static final String PAYMENT_COMMAND_STRING = '_ap-payment&paykey=';
    private static final String PREAPPROVAL_COMMAND_STRING = '_ap-preapproval&preapprovalkey=';
    
    
 
    global PPSetPaymentOptionsResponse setPaymentOptions(PPSetPaymentOptionsRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPSetPaymentOptionsResponse response = new PPSetPaymentOptionsResponse();
        executeCommand(request, response);
        
        return response;
    }

    global PPGetPaymentOptionsResponse getPaymentOptions(PPGetPaymentOptionsRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPGetPaymentOptionsResponse response = new PPGetPaymentOptionsResponse();
        executeCommand(request, response);
        return response;
    }

    global PPGetFundingPlansResponse getFundingPlans(PPGetFundingPlansRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPGetFundingPlansResponse response = new PPGetFundingPlansResponse();
        executeCommand(request, response);
        return response;
    }
    
    global PPGetShippingAddressesResponse getShippingAddresses(PPGetShippingAddressesRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	// send the request
        PPGetShippingAddressesResponse response = new PPGetShippingAddressesResponse();
        executeCommand(request, response);
        return response;
    }    
    
    global PPAddBankAccountResponse addBankAccount(PPAddBankAccountRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPAddBankAccountResponse response = new PPAddBankAccountResponse();
        executeCommand(request, response);
        return response;
    }
    
    global PPAddPaymentCardResponse addPaymentCard(PPAddPaymentCardRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPAddPaymentCardResponse response = new PPAddPaymentCardResponse();
        executeCommand(request, response);
        return response;
    } 
    
    global PPGetVerifiedStatusResponse getVerifiedStatus(PPGetVerifiedStatusRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPGetVerifiedStatusResponse response = new PPGetVerifiedStatusResponse();
        executeCommand(request, response);
        return response;
    } 
              
    global PPSetFundingSourceConfirmedResponse setFundingSourceConfirmed(PPSetFundingSourceConfirmedRequest request) {
    	// set the Service Type
    	BaseAPIProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	// send the request
        PPSetFundingSourceConfirmedResponse response = new PPSetFundingSourceConfirmedResponse();
        executeCommand(request, response);
        return response;
    } 
    
    
}