global class PPFundingPlanCharge {
	
	global PPCurrencyType Charge {get; set;}	
	global PPFundingSource FundingSource {get; set;}
	
	global PPFundingPlanCharge(){
		Charge = new PPCurrencyType();
		FundingSource = new PPFundingSource();
	}

}