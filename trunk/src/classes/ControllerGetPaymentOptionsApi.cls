public class ControllerGetPaymentOptionsApi {
	
	public String MainMessage{get;set;}	
	public Boolean isDisplay{get;set;}	
	public Boolean isErr{get;set;}
	
    public PPGetPaymentOptionsRequest GetPaymentOptionsRequest{get;set;}   
    public PPGetPaymentOptionsResponse GetPaymentOptionsResponse{get;set;}
    
    public List<PPReceiverOptions> outParameterList{get;set;}
	
    public PPResponseEnvelope RespEnvp{get;set;}
	
    public String CommonParametersObjName{get;set;}    
    public String APICredentialObjName{get;set;}
    
    public String PayKey {get;set;}
    
    public PPReceiverOptions ReceiverOptions{get;set;}
        
    
    public ControllerGetPaymentOptionsApi(){
    	outParameterList = new List<PPReceiverOptions>();
    	ReceiverOptions = new PPReceiverOptions();
    }
    
    public Pagereference apply(){
 
    	MainMessage = '';    	
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;
        
		// create request envelope and set the common request parameters
        GetPaymentOptionsRequest = new PPGetPaymentOptionsRequest(CommonParametersObjName);
        GetPaymentOptionsRequest.PayKey = PayKey;      
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        try{
        	
        	outParameterList.clear();
        	
        	GetPaymentOptionsResponse = toolkit.getPaymentOptions(GetPaymentOptionsRequest);
        	
        	RespEnvp = GetPaymentOptionsResponse.getResponseEnvelope();
        	
        	for(Integer index=0;index < GetPaymentOptionsResponse.ReceiverOptions.size();index++){
        		ReceiverOptions = GetPaymentOptionsResponse.ReceiverOptions.get(index);
        	}
        	        	
        	isDisplay = true;        	
        	
        }catch(PPFaultMessageException ex){
        	
        	System.debug('PPFaultMessageException =>' + ex);
        	RespEnvp = ex.ResponseEnvelope;
            List<PPErrorData> errlist = ex.ErrorList;
	        for( PPErrorData err: errList ){
                   MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';
			}        	        	
        	isErr = true ;
        	
        	
        }catch(System.Exception e){
        	
        	MainMessage = e.getmessage();
        	
        } 
            	
    	return page;
    	
    }
    
    
    
    
	

}