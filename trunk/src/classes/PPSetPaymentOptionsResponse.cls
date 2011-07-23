global class PPSetPaymentOptionsResponse extends PPResponse{
	
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {

    	try {
    		
    		super.parseCommonParams(Parameters);
    		
    	}catch(System.Exception e){
    		
    		System.Debug(Logginglevel.ERROR, 'PPSetPaymentOptionsResponse:parseResponseParameters() : ' + e);
    		
    	}        	
    }
	

}