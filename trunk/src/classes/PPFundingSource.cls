global class PPFundingSource {
	
	global String LastFourOfAccountNumber {get; set;}	
	global String FundingSourceType {get; set;}	
	global String DisplayName {get; set;}	
	global String FundingSourceId {get; set;}	
	global Boolean Allowed {get; set;}
	
	global PPFundingSource() {
		LastFourOfAccountNumber = '';
		FundingSourceType = '';
		DisplayName = '';
		FundingSourceId = '';
		Allowed = false;
	}
	
}