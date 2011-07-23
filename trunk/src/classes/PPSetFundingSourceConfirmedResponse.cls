global class PPSetFundingSourceConfirmedResponse extends PPResponse {

	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
	public override void parseResponseParameters(Map<String, String> parameters) {
    	super.parseCommonParams(Parameters);
	}
	
}