global class PPFundingPlan {
	
	global String FundingPlanId {get; set;}	
	global PPCurrencyType FundingAmount {get; set;}	
	global PPFundingSource BackupFundingSource {get; set;}	
	global PPCurrencyType SenderFees {get; set;}
		
	global PPCurrencyType FromCurrency {get; set;}
	global PPCurrencyType ToCurrency {get; set;}
	global decimal ExchangeRate {get; set;}
		
	global List<PPFundingPlanCharge> Charge {get; set;}
	
	global PPFundingPlan(){
		FundingPlanId = '';
		FundingAmount = new PPCurrencyType();
		BackupFundingSource = new PPFundingSource();
		SenderFees = new PPCurrencyType();
		
		FromCurrency = new PPCurrencyType();
		ToCurrency = new PPCurrencyType();
		ExchangeRate = 0.0;
		
		Charge = new List<PPFundingPlanCharge>();
		
		
	}
		
		
}