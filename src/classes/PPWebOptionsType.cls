global class PPWebOptionsType {

	global String ReturnUrl {get; set;}
	
	global String CancelUrl {get; set;}
	
	global String ReturnUrlDescription {get; set;}
	
	global String CancelUrlDescription {get; set;}
	
	global PPWebOptionsType(){
		ReturnUrl = '';
		CancelUrl = '';
		ReturnUrlDescription = '';
		CancelUrlDescription = '';
	}
	

}