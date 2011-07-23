global class PPGetFundingPlansResponse extends PPResponse {
	
	global List<PPFundingPlan> FundingPlanList{get;set;}
	
	global PPGetFundingPlansResponse() {
		FundingPlanList = new List<PPFundingPlan>();
	}
		
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	
    	try{
    		super.parseCommonParams(Parameters);
    		   		    		
    		Map<String, String> fundingPlansMap = null;    		   		
	    	Integer fundingPlansNo = 0;
    		Boolean isMoreInfo = true;
    		Map<String,String> fundingPlansMapWithChargeCode = null;
    		
			while (isMoreInfo) {
							
				String tagFundingPlanWithNo = 'fundingPlan(' + fundingPlansNo + ').';
												
				fundingPlansMapWithChargeCode = PPUtils.getMapWithSpecificKeys(parameters, tagFundingPlanWithNo);

				fundingPlansMap = PPUtils.getMapWithoutSpecificKeys(fundingPlansMapWithChargeCode, 'charge');				
				
				if (Null != fundingPlansMap && 0 != fundingPlansMap.size()) {
					
					PPFundingPlan fundingPlan = new PPFundingPlan();

					String tagFundingPlanId = tagFundingPlanWithNo + 'fundingPlanId';					
					if(fundingPlansMap.containsKey(tagFundingPlanId))
						fundingPlan.FundingPlanId = fundingPlansMap.remove(tagFundingPlanId);					
					
					String tagFundingAmountCode = tagFundingPlanWithNo + 'fundingAmount.code';				
					if(fundingPlansMap.containsKey(tagFundingAmountCode))
						fundingPlan.FundingAmount.Code = fundingPlansMap.remove(tagFundingAmountCode);
						
					String tagFundingAmount = tagFundingPlanWithNo + 'fundingAmount.amount';					
					if(fundingPlansMap.containsKey(tagFundingAmount))
						fundingPlan.FundingAmount.Amount = Decimal.valueOf(fundingPlansMap.remove(tagFundingAmount));
					
					String tagBackupFundingSourceType = tagFundingPlanWithNo + 'backupFundingSource.type';					
					if(fundingPlansMap.containsKey(tagBackupFundingSourceType)){
						PPFundingSource backupFundingSource = new PPFundingSource();						
						backupFundingSource.FundingSourceType = fundingPlansMap.remove(tagBackupFundingSourceType);
						
						String tagBackupFundingSourceLastFour = tagFundingPlanWithNo + 'backupFundingSource.lastFourOfAccountNumber';
						if(fundingPlansMap.containsKey(tagBackupFundingSourceLastFour))
							backupFundingSource.LastFourOfAccountNumber = fundingPlansMap.remove(tagBackupFundingSourceLastFour);

						String tagBackupFundingSourceDispName = tagFundingPlanWithNo + 'backupFundingSource.displayName';
						if(fundingPlansMap.containsKey(tagBackupFundingSourceDispName))
							backupFundingSource.DisplayName = fundingPlansMap.remove(tagBackupFundingSourceDispName);
							
						String tagBackupFundingSourceId = tagFundingPlanWithNo + 'backupFundingSource.fundingSourceId';
						if(fundingPlansMap.containsKey(tagBackupFundingSourceId))
							backupFundingSource.FundingSourceId = fundingPlansMap.remove(tagBackupFundingSourceId);

						String tagBackupFundingSourceAllowed = tagFundingPlanWithNo + 'backupFundingSource.allowed';
						if(fundingPlansMap.containsKey(tagBackupFundingSourceId))
							backupFundingSource.Allowed = Boolean.valueOf(fundingPlansMap.remove(tagBackupFundingSourceAllowed));

						fundingPlan.BackupFundingSource = backupFundingSource;
					}
					
					String tagSenderFeesCode = tagFundingPlanWithNo + 'senderFees.code';
					if(fundingPlansMap.containsKey(tagSenderFeesCode))
							fundingPlan.SenderFees.Code = fundingPlansMap.remove(tagSenderFeesCode);

					String tagSenderFeesAmount = tagFundingPlanWithNo + 'senderFees.amount';
					if(fundingPlansMap.containsKey(tagSenderFeesAmount))
							fundingPlan.SenderFees.Amount = Decimal.valueOf(fundingPlansMap.remove(tagSenderFeesAmount));					
					
					String tagCurrencyConversionFromCode = tagFundingPlanWithNo + 'currencyConversion.from.code';
					if(fundingPlansMap.containsKey(tagCurrencyConversionFromCode))
							fundingPlan.FromCurrency.Code = fundingPlansMap.remove(tagCurrencyConversionFromCode);					

					String tagCurrencyConversionToCode = tagFundingPlanWithNo + 'currencyConversion.to.code';
					if(fundingPlansMap.containsKey(tagCurrencyConversionToCode))
							fundingPlan.ToCurrency.Code = fundingPlansMap.remove(tagCurrencyConversionToCode);					

					String tagExchangeRate = tagFundingPlanWithNo + 'currencyConversion.exchangeRate';
					if(fundingPlansMap.containsKey(tagExchangeRate))
							fundingPlan.ExchangeRate = Decimal.valueOf(fundingPlansMap.remove(tagExchangeRate));					

					Integer fundingPlanChargeNo = 0;
					Boolean isMoreCharge = true;
					Map<String, String> fundingPlansChargeMap = null;
					
					List<PPFundingPlanCharge> fundingPlanCharges = new List<PPFundingPlanCharge>();
					
					while(isMoreCharge){
						String tagFundingPlanCharge = tagFundingPlanWithNo + 'charge(' + fundingPlanChargeNo +').';
						fundingPlansChargeMap = PPUtils.getMapWithSpecificKeys(parameters, tagFundingPlanCharge);
						if (Null != fundingPlansChargeMap && 0 != fundingPlansChargeMap.size()) {
							
							PPFundingPlanCharge fpCharge = new PPFundingPlanCharge();
							
							String tagChargeCode =  tagFundingPlanCharge + 'charge.code';
							if(fundingPlansMapWithChargeCode.containsKey(tagChargeCode))
								fpCharge.Charge.Code = fundingPlansMapWithChargeCode.remove(tagChargeCode);					

							String tagChargeAmount =  tagFundingPlanCharge + 'charge.amount';
							if(fundingPlansMapWithChargeCode.containsKey(tagChargeAmount))
								fpCharge.Charge.Amount = Decimal.valueOf(fundingPlansMapWithChargeCode.remove(tagChargeAmount));								  	
							
							String tagFundingChargeType =  tagFundingPlanCharge + 'fundingSource.type';
							
							List<PPFundingSource> fundingSourcesList = new List<PPFundingSource>();
							
							if(fundingPlansMapWithChargeCode.containsKey(tagFundingChargeType)){
								PPFundingSource chargeSource = new PPFundingSource();
								
								chargeSource.FundingSourceType = fundingPlansMapWithChargeCode.remove(tagFundingChargeType);
								
								String tagFundingChargeLastFour = tagFundingPlanCharge + 'fundingSource.lastFourOfAccountNumbr';
								if(fundingPlansMapWithChargeCode.containsKey(tagFundingChargeLastFour)){
									chargeSource.LastFourOfAccountNumber = fundingPlansMapWithChargeCode.remove(tagFundingChargeLastFour);
								}

								String tagFundingChargeDisplayName = tagFundingPlanCharge + 'fundingSource.displayNmae';
								if(fundingPlansMapWithChargeCode.containsKey(tagFundingChargeDisplayName)){
									chargeSource.DisplayName = fundingPlansMapWithChargeCode.remove(tagFundingChargeDisplayName);
								}
								
								String tagFundingChargeSourceId = tagFundingPlanCharge + 'fundingSource.fundingSourceId';
								if(fundingPlansMapWithChargeCode.containsKey(tagFundingChargeSourceId)){
									chargeSource.FundingSourceId = fundingPlansMapWithChargeCode.remove(tagFundingChargeSourceId);
								}
								
								String tagFundingChargeAllowed = tagFundingPlanCharge + 'fundingSource.allowed';
								if(fundingPlansMapWithChargeCode.containsKey(tagFundingChargeAllowed)){
									chargeSource.Allowed = Boolean.valueOf(fundingPlansMapWithChargeCode.remove(tagFundingChargeAllowed));
								}
								
								fundingSourcesList.add(chargeSource);
																
							}
															  															
							fundingPlanCharges.add(fpCharge);
							
							fundingPlanChargeNo++;
							
						}else{
							 isMoreCharge = false;
						}
					}
														
					fundingPlan.Charge = fundingPlanCharges;
					
					FundingPlanList.add(fundingPlan);
					
					fundingPlansNo++;
					
					
				}else{
					
					isMoreInfo = false;
					
				}								
			}
    		    			    		 		
    	}catch(System.Exception e){    		
    		System.Debug(Logginglevel.ERROR, 'PPSetPaymentOptionsResponse:parseResponseParameters() : ' + e);    		
    	}    	
    	
    }    	

}