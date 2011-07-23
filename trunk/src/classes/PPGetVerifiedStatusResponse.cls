global class PPGetVerifiedStatusResponse extends PPResponse {

	global String AccountStatus {get; set;}
		
 	// Constructor
 	global PPGetVerifiedStatusResponse() {
 		AccountStatus = '';
 	}
 	
 	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {

    	try {

    		super.parseCommonParams(Parameters);
    		    		
    		if (parameters.containsKey('accountStatus'))
		 		AccountStatus = parameters.remove('accountStatus');
 
    	}catch(System.Exception e){
    		
    		System.Debug(Logginglevel.ERROR, 'PPGetVerifiedStatusResponse:parseResponseParameters() : ' + e);
    		
    	}   
    	
    } 

}