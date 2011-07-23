global class PPWebOptions {

	global String ReturnUrl {get; set;}
	
	global String CancelUrl {get; set;}
	
	global String ReturnUrlDescription {get; set;}
	
	global String CancelUrlDescription {get; set;}
	
	public PPWebOptions(){		
		ReturnUrl = '';
		CancelUrl = '';
		ReturnUrlDescription = '';
		CancelUrlDescription = '';
	}
	
}