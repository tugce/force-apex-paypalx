global class PPGetPaymentOptionsResponse extends PPResponse{
	
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
	
	
	global PPGetPaymentOptionsResponse() {
	    
		EmailHeaderImageUrl = '';
		EmailMarketingImageUrl= '';
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
		SharePhoneNumber  =  '';
		ShareAddress = '';
		
		ReceiverOptions = new List<PPReceiverOptions>();
		   	
	}
	
	
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {

    	try {

			String tagDispOption = PPStaticRes.DISPLAY_OPTIONS + PPStaticRes.DOT;
			String tagInitEntity = PPStaticRes.INITIATING_ENTITY + PPStaticRes.DOT + PPStaticRes.INSTITUTION_CUSTOMER + PPStaticRes.DOT;
			String tagSenderOpt = PPStaticRes.SENDER_OPTIONS + PPStaticRes.DOT ;    		
    		   		
    		super.parseCommonParams(Parameters);
    		
    		String tagEmailHeaderImageUrl =  tagDispOption + PPStaticRes.DISPOPT_EMAIL_HDR_IMG_URL;    		
    		if (parameters.containsKey(tagEmailHeaderImageUrl))
		 		EmailHeaderImageUrl = parameters.remove(tagEmailHeaderImageUrl);
    		
    		String tagEmailMarketingImageUrl = tagDispOption + PPStaticRes.DISPOPT_EMAIL_MKT_IMG_URL;
    		if (parameters.containsKey(tagEmailMarketingImageUrl))
		 		EmailMarketingImageUrl = parameters.remove(tagEmailMarketingImageUrl);
		 		
		 	String tagHeaderImageUrl = tagDispOption + PPStaticRes.DISPOPT_HDR_IMG_URL;
    		if (parameters.containsKey(tagHeaderImageUrl))
		 		HeaderImageUrl = parameters.remove(tagHeaderImageUrl);
		 		
    		String tagBusinessName = tagDispOption + PPStaticRes.DISPOPT_BUS_NAME ;
    		if (parameters.containsKey(tagBusinessName))
		 		BusinessName = parameters.remove(tagBusinessName);
		 		
		 	String tagCountryCode =  tagInitEntity + PPStaticRes.INST_CUST_CNTRY_CD;
		 	if (parameters.containsKey(tagCountryCode))
		 		CountryCode = parameters.remove(tagCountryCode);
		 		
	 		String tagDisplayName = tagInitEntity + PPStaticRes.INST_CUST_DISP_NAME;
		 	if (parameters.containsKey(tagDisplayName))
		 		DisplayName = parameters.remove(tagDisplayName); 		
	 		
    		String tagEmail = tagInitEntity + PPStaticRes.INST_CUST_EMAIL;
		 	if (parameters.containsKey(tagEmail))
		 		Email = parameters.remove(tagEmail);
		 		 		
    		String tagFirstName = tagInitEntity + PPStaticRes.INST_CUST_FIRST_NAME ;
    		if (parameters.containsKey(tagFirstName))
		 		FirstName = parameters.remove(tagFirstName);
		 		
    		String tagLastName = tagInitEntity + PPStaticRes.INST_CUST_LAST_NAME ;
    		if (parameters.containsKey(tagLastName))
		 		LastName = parameters.remove(tagLastName);
		 		
    		String tagInstitutionCustomerId = tagInitEntity + PPStaticRes.INST_CUST_ID ;
    		if (parameters.containsKey(tagInstitutionCustomerId))
		 		InstitutionCustomerId = parameters.remove(tagInstitutionCustomerId);
    		
    		String tagInstId = tagInitEntity + PPStaticRes.INST_ID;
     		if (parameters.containsKey(tagInstId))
		 		InstitutionId = parameters.remove(tagInstId);   		
    		
    		String tagRequireShippingAddressSelection = tagSenderOpt + PPStaticRes.SHPNG_ADR_SELECTION ;
    		if (parameters.containsKey(tagRequireShippingAddressSelection))
		 		RequireShippingAddressSelection = parameters.remove(tagRequireShippingAddressSelection);  
    		
    		String tagSharePhoneNumber = tagSenderOpt + PPStaticRes.SHARE_PHONE_NO ;
     		if (parameters.containsKey(tagSharePhoneNumber))
		 		SharePhoneNumber = parameters.remove(tagSharePhoneNumber);     		
    		
    		String tagShareAddress = tagSenderOpt + PPStaticRes.SHARE_ADDRESS;
     		if (parameters.containsKey(tagShareAddress))
		 		ShareAddress = parameters.remove(tagShareAddress);
		 		
			Map<String, String> receiverOptionsMap = null;			
			Boolean isMoreInfo = true;
			Integer receiverOptionsNo = 0;
			
			while(isMoreInfo){
				String tagReceiverOptWithNo = 'receiverOptions(' + receiverOptionsNo + ').';
				receiverOptionsMap = PPUtils.getMapWithSpecificKeys(Parameters, tagReceiverOptWithNo);
										
				if (Null != receiverOptionsMap && 0 != receiverOptionsMap.size()) {
					
					PPReceiverOptions receiverOption = new PPReceiverOptions();
					
					String tagCustomId = tagReceiverOptWithNo + 'customId';					
					if(receiverOptionsMap.containsKey(tagCustomId))
						receiverOption.CustomId = receiverOptionsMap.remove(tagCustomId);
						
					String tagDescription = tagReceiverOptWithNo + 'description';
					if(receiverOptionsMap.containsKey(tagDescription))
						receiverOption.Description = receiverOptionsMap.remove(tagDescription);
									
					PPInvoiceData invoiceData = new PPInvoiceData();
					
					String tagInvoiceDataTotalTax = tagReceiverOptWithNo + 'invoiceData.totalTax';					
					if(receiverOptionsMap.containsKey(tagInvoiceDataTotalTax)){
						String strTotalTax = receiverOptionsMap.remove(tagInvoiceDataTotalTax);					
						invoiceData.TotalTax = Decimal.valueOf(strTotalTax);
					}
						
					String tagInvoiceDataTotalShipping = tagReceiverOptWithNo + 'invoiceData.totalShipping';					
					if(receiverOptionsMap.containsKey(tagInvoiceDataTotalShipping)){
						String strTotalShipping = receiverOptionsMap.remove(tagInvoiceDataTotalShipping);					
						invoiceData.TotalShipping = Decimal.valueOf(strTotalShipping);
					}
					
					receiverOption.InvoiceData = invoiceData;
					
					String tagReceiverEmail = tagReceiverOptWithNo + 'receiver.email';
					if(receiverOptionsMap.containsKey(tagReceiverEmail)){
						receiverOption.Receiver.Email = receiverOptionsMap.remove(tagReceiverEmail);
					}
					
					PPPhoneNumber phone = new PPPhoneNumber();
					String tagPhoneCountryCode = tagReceiverOptWithNo + 'receiver.phone.countryCode';
					if(receiverOptionsMap.containsKey(tagPhoneCountryCode)){
						phone.countryCode = receiverOptionsMap.remove(tagPhoneCountryCode);
					}

					String tagPhoneNumber = tagReceiverOptWithNo + 'receiver.phone.phoneNumber';
					if(receiverOptionsMap.containsKey(tagPhoneNumber)){
						phone.phoneNumber = receiverOptionsMap.remove(tagPhoneNumber);
					}
					
					String tagPhoneExtension = tagReceiverOptWithNo + 'receiver.phone.extension';
					if(receiverOptionsMap.containsKey(tagPhoneExtension)){
						phone.extension = receiverOptionsMap.remove(tagPhoneExtension);
					}					
					
					receiverOption.Receiver.Phone = phone;					
										
					ReceiverOptions.add(receiverOption);
									
					receiverOptionsNo++;
							
				}else {					
					isMoreInfo = false;
				}
			}
    		
    	}catch(System.Exception e){
    		
    		System.Debug(Logginglevel.ERROR, 'PPSetPaymentOptionsResponse:parseResponseParameters() : ' + e);
    		
    	}
    	
    }	

}