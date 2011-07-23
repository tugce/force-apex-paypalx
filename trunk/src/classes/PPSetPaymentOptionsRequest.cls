global class PPSetPaymentOptionsRequest extends PPRequest {
	
	global String PayKey {get;set;}	
	global String EmailHeaderImageUrl {get;	set;}
	global String EmailMarketingImageUrl {get;set;}
	global String HeaderImageUrl {get;set;}
	global String BusinessName {get;set;}
	global String CountryCode {get;set;}
	global String DisplayName {get;set;}
	global String Email {get;set;}
	global String FirstName {get;set;}
	global String LastName {get;set;}
	global String InstitutionCustomerId {get;set;}
 	global String InstitutionId {get;set;}
 	global String ShippingAddressId {get;set;}
 	global String RequireShippingAddressSelection {get;set;}
 	global String SharePhoneNumber {get;set;}
 	global String ShareAddress {get;set;}
 	
 	global List<PPReceiverOptions> ReceiverOptions {get;set;}
 		
	
	global PPSetPaymentOptionsRequest(String CommonRequestParametersObjectName) {
		
		ApiName = PPStaticRes.SET_PAYMENT_OPTIONS_API;
		
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
						
		PayKey = '';
		EmailHeaderImageUrl = '';
		EmailMarketingImageUrl = '';
		HeaderImageUrl = '';
		BusinessName = '';
		CountryCode = '';
		DisplayName = '';
		Email = '';
		FirstName = '';
		LastName = '';
		InstitutionCustomerId = '';
		InstitutionId = '';
		ShippingAddressId = '';
		RequireShippingAddressSelection = '';
		SharePhoneNumber = '' ;
		ShareAddress = '';
		
		ReceiverOptions = new List<PPReceiverOptions>();
		
	}	
	
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {

		String tagDispOption = PPStaticRes.DISPLAY_OPTIONS + PPStaticRes.DOT;
		String tagInitEntity = PPStaticRes.INITIATING_ENTITY + PPStaticRes.DOT + PPStaticRes.INSTITUTION_CUSTOMER + PPStaticRes.DOT;
		String tagSenderOpt = PPStaticRes.SENDER_OPTIONS + PPStaticRes.DOT ;
		
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			
			if (Null != PayKey && 0 != PayKey.length())		
    			requestParams.put(PPStaticRes.PAY_KEY, PayKey);
    			   			
  	 		if (Null != ShippingAddressId && 0 != ShippingAddressId.length())			
  	 			requestParams.put(PPStaticRes.SHPNG_ADR_ID, ShippingAddressId);  	 					
    			
    		if (Null != EmailHeaderImageUrl && 0 != EmailHeaderImageUrl.length()){
    			String tagEmailHeaderImageUrl =  tagDispOption + PPStaticRes.DISPOPT_EMAIL_HDR_IMG_URL;
    			requestParams.put(tagEmailHeaderImageUrl, EmailHeaderImageUrl);
    		}	
 
    		if (Null != EmailMarketingImageUrl && 0 != EmailMarketingImageUrl.length()){
    			String tagEmailMarketingImageUrl = tagDispOption + PPStaticRes.DISPOPT_EMAIL_MKT_IMG_URL;
    			requestParams.put(tagEmailMarketingImageUrl, EmailMarketingImageUrl);
    		}	
    			   			   			
    		if (Null != HeaderImageUrl && 0 != HeaderImageUrl.length()){
    			String tagHeaderImageUrl = tagDispOption + PPStaticRes.DISPOPT_HDR_IMG_URL;
    			requestParams.put(tagHeaderImageUrl, HeaderImageUrl);
    		}	
    					
    		if (Null != BusinessName && 0 != BusinessName.length()){			
    			String tagBusinessName = tagDispOption + PPStaticRes.DISPOPT_BUS_NAME ;
    			requestParams.put(tagBusinessName, BusinessName);
    		}	
    			
  	 		if (Null != CountryCode && 0 != CountryCode.length()){
  	 			String tagCountryCode =  tagInitEntity + PPStaticRes.INST_CUST_CNTRY_CD;
  	 			requestParams.put(tagCountryCode, CountryCode);
  	 		}		
    			
  	 		if (Null != DisplayName && 0 != DisplayName.length()){
  	 			String tagDisplayName = tagInitEntity + PPStaticRes.INST_CUST_DISP_NAME;
  	 			requestParams.put(tagDisplayName, DisplayName);
  	 		}		
    			    		
  	 		if (Null != Email && 0 != Email.length()){
  	 			String tagEmail = tagInitEntity + PPStaticRes.INST_CUST_EMAIL;
  	 			requestParams.put(tagEmail, Email);
  	 		}		

  	 		if (Null != FirstName && 0 != FirstName.length()){
  	 			String tagFirstName = tagInitEntity + PPStaticRes.INST_CUST_FIRST_NAME ;
  	 			requestParams.put(tagFirstName, FirstName);
  	 		}	
    			   			
  	 		if (Null != LastName && 0 != LastName.length()){
  	 			String tagLastName = tagInitEntity + PPStaticRes.INST_CUST_LAST_NAME ;
  	 			requestParams.put(tagLastName, LastName);
  	 		}	
    			   			
  	 		if (Null != InstitutionCustomerId && 0 != InstitutionCustomerId.length()){
  	 			String tagInstitutionCustomerId = tagInitEntity + PPStaticRes.INST_CUST_ID ;
  	 			requestParams.put(tagInstitutionCustomerId , InstitutionCustomerId);
  	 		}	
    			
  	 		if (Null != InstitutionId && 0 != InstitutionId.length()){
  	 			String tagInstId = tagInitEntity + PPStaticRes.INST_ID;
  	 			requestParams.put(tagInstId, InstitutionId);
  	 		}	
	
  	 		if (Null != RequireShippingAddressSelection && 0 != RequireShippingAddressSelection.length()){
				String tagRequireShippingAddressSelection = tagSenderOpt + PPStaticRes.SHPNG_ADR_SELECTION ;
    			requestParams.put(tagRequireShippingAddressSelection, RequireShippingAddressSelection);
  	 		}
  	 		
  	 		if (Null != SharePhoneNumber && 0 != SharePhoneNumber.length()){
				String tagSharePhoneNumber = tagSenderOpt + PPStaticRes.SHARE_PHONE_NO ;
    			requestParams.put(tagSharePhoneNumber, SharePhoneNumber);
  	 		}

  	 		if (Null != ShareAddress && 0 != ShareAddress.length()){
				String tagShareAddress = tagSenderOpt + PPStaticRes.SHARE_ADDRESS;
    			requestParams.put(tagShareAddress, ShareAddress);
  	 		}
  	 		
  	 		System.Debug('****ParamsBeforeReceiverOptions***' + requestParams);
  	 		
  	 		System.Debug('*****ReceiverOptions.size=' + ReceiverOptions.size());
  	 		
  	 		for(integer count = 0; count < ReceiverOptions.size(); count++){
  	 			 	 			
  	 			PPReceiverOptions ro = ReceiverOptions.get(count);
  	 			
  	 			System.Debug('*****PPReceiverOptions=' + ro);
  	 							
				if(ro != null){
					if (Null != ro.Description && 0 != ro.Description.length()){					
		  	 			String tagDesc = 'receiverOptions('  + count + ').description';
		  	 			requestParams.put(tagDesc, ro.Description);
					}

					if (Null != ro.CustomId && 0 != ro.CustomId.length()){					
		  	 			String tagCustomId = 'receiverOptions('  + count + ').customId';
		  	 			requestParams.put(tagCustomId,ro.CustomId);		  	 			
					}
					
					if(ro.InvoiceData != null){
						if (ro.InvoiceData.TotalShipping > 0){					
		  	 				String tagTotalShipping = 'receiverOptions('  + count + ').invoiceData.totalShipping';
		  	 				requestParams.put(tagTotalShipping,String.valueOf(ro.InvoiceData.TotalShipping));		  	 			
						}
						if (ro.InvoiceData.TotalTax > 0){					
		  	 				String tagTotalTax = 'receiverOptions('  + count + ').invoiceData.totalTax';
		  	 				requestParams.put(tagTotalTax,String.valueOf(ro.InvoiceData.TotalTax));		  	 			
						}
						
						if(ro.InvoiceData.Item != null){							
							for(integer itemCount=0 ; itemCount < ro.InvoiceData.Item.size() ; itemCount++){
								PPInvoiceItem item = ro.InvoiceData.Item.get(itemCount);								
								if(item.ItemName != null && item.ItemName.length() > 0 ){									
									String tagItemName = 'receiverOptions(' + count + ').invoiceData.item(' + itemCount + ').name';
									requestParams.put(tagItemName,item.ItemName);										
								}
								if(item.Identifier != null && item.Identifier.length() > 0 ){									
									String tagIdentifier = 'receiverOptions(' + count + ').invoiceData.item(' + itemCount + ').identifier';
									requestParams.put(tagIdentifier,item.Identifier);										
								}
								if(item.Price != null && item.Price > 0 ){									
									String tagPrice = 'receiverOptions(' + count + ').invoiceData.item(' + itemCount + ').price';
									requestParams.put(tagPrice,String.valueOf(item.Price));										
								}
								if(item.ItemPrice != null && item.ItemPrice > 0 ){									
									String tagItemPrice = 'receiverOptions(' + count + ').invoiceData.item(' + itemCount + ').itemPrice';
									requestParams.put(tagItemPrice,String.valueOf(item.ItemPrice));										
								}								
							}							
						}						
					
						System.Debug('******InvoceData=' + ro.InvoiceData);
					}
					
					if(ro.Receiver != null){
						if(ro.Receiver.email != null && ro.Receiver.email.length() > 0 ){
							String tagEmail = 'receiverOptions(' + count + ').receiver.email';
							requestParams.put(tagEmail,ro.Receiver.email);	
						}
						if(ro.Receiver.Phone.countryCode != null && ro.Receiver.Phone.countryCode.length() > 0 ){
							String tagPhoneountryCode = 'receiverOptions(' + count + ').receiver.phone.countryCode';
							requestParams.put(tagPhoneountryCode,ro.Receiver.Phone.countryCode);	
						}
						if(ro.Receiver.Phone.phoneNumber != null && ro.Receiver.Phone.phoneNumber.length() > 0 ){
							String tagPhoneNumber = 'receiverOptions(' + count + ').receiver.phone.phoneNumber';
							requestParams.put(tagPhoneNumber,ro.Receiver.Phone.phoneNumber);							
						}
						if(ro.Receiver.Phone.extension != null && ro.Receiver.Phone.extension.length() > 0 ){
							String tagPhoneExtension = 'receiverOptions(' + count + ').receiver.phone.extension';
							requestParams.put(tagPhoneExtension,ro.Receiver.Phone.extension);							
						}						
					}
					
					System.Debug('*******Receiver=' + ro.Receiver);						
				}
			}				  	 			  	 						
		}				
		System.debug('*********RequestParams******=' + requestParams);
	}	
}