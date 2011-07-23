public class ControllerGetShippingAddressesApi {
	
	public String MainMessage{get;set;}	
	public Boolean isDisplay{get;set;}	
	public Boolean isErr{get;set;}
	
	public PPResponseEnvelope RespEnvp{get;set;}
	
    public String CommonParametersObjName{get;set;}    
    public String APICredentialObjName{get;set;}
    
    public String Key {get;set;}
    
   public PPGetShippingAddressesRequest GetShippingAddressesRequest{get;set;}   
   public PPGetShippingAddressesResponse GetShippingAddressesResponse{get;set;}    
    
    public Pagereference apply(){ 
   	
    	MainMessage = '';    	
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        try{
        	
			// create request envelope and set the common request parameters
	        GetShippingAddressesRequest = new PPGetShippingAddressesRequest(CommonParametersObjName);
	        GetShippingAddressesRequest.Key = Key;        	
	        GetShippingAddressesResponse = toolkit.getShippingAddresses(GetShippingAddressesRequest);        	
        	
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