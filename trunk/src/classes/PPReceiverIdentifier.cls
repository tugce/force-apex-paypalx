global class PPReceiverIdentifier {

	global String Email  {get; set;}
	
	global PPPhoneNumber Phone  {get; set;}
	
	// Constructor
    global PPReceiverIdentifier() {    
    	Email = '';
    	Phone = new PPPhoneNumber();	    	
    }
	
}