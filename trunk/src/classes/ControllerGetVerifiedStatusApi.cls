public class ControllerGetVerifiedStatusApi {

	public String MainMessage{get;set;}	
	public Boolean isDisplay{get;set;}	
	public Boolean isErr{get;set;}
	
    public PPGetVerifiedStatusRequest GetVerifiedStatusRequest{get;set;}   
    public PPGetVerifiedStatusResponse GetVerifiedStatusResponse{get;set;}

    public PPResponseEnvelope RespEnvp{get;set;}
	
    public String CommonParametersObjName{get;set;}    
    public String APICredentialObjName{get;set;}
    
	public String EmailAddress {get;set;}
	public String FirstName {get;set;}
	public String LastName {get;set;}
	public String MatchCriteria {get;set;}
	
	public String SandboxEmailAddress {get;set;}
	
	public String AccountStatus {get;set;}

    public ControllerGetVerifiedStatusApi(){

		EmailAddress = '';
		FirstName = '';
		LastName = '';
		MatchCriteria = 'NAME';
	
		SandboxEmailAddress = '';
		
		AccountStatus = '';

    }

    public Pagereference apply(){
    	
    	MainMessage = '';    	
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;
        
        GetVerifiedStatusRequest = new PPGetVerifiedStatusRequest(CommonParametersObjName);
        
        GetVerifiedStatusRequest.EmailAddress = EmailAddress;
        GetVerifiedStatusRequest.FirstName = FirstName;
        GetVerifiedStatusRequest.LastName = LastName;
        GetVerifiedStatusRequest.MatchCriteria = MatchCriteria; //Currently only NAME is supported
        GetVerifiedStatusRequest.SandboxEmailAddress = SandboxEmailAddress ;
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
            	
        try{
        	
			GetVerifiedStatusResponse = toolkit.getVerifiedStatus(GetVerifiedStatusRequest);
			
			AccountStatus = GetVerifiedStatusResponse.AccountStatus;
			
			RespEnvp = GetVerifiedStatusResponse.getResponseEnvelope();
			
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