global class PPSenderIdentifier {
	
	global String Email {get; set;}
	
	global Boolean UseCredentials  {get; set;}
	
	global PPPhoneNumber Phone {get; set;} 
	
		// Constructor
	global PPSenderIdentifier() {
		
		Email = '';
		UseCredentials = false;
		Phone = new PPPhoneNumber();
	}	

}