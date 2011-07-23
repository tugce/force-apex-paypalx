global class ControllerSetFundingSourceConfirmed {

    public String MainMessage						{get;set;}
    public string SuccessMessage					{get;set;}
    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
    
    public Boolean isDisplay						{get;set;}
    public PPResponseEnvelope ResponseEnvelope		{get;set;}
    public Boolean isErr							{get;set;}
    
    public PPSetFundingSourceConfirmedRequest 	SetFundingSourceConfirmedRequest	{get;set;}    
    public PPSetFundingSourceConfirmedResponse  SetFundingSourceConfirmedResponse {get;set;}
    
	public String AccountId {get;set;}
	public String EmailAddress {get;set;}
	public String FundingSourceKey {get;set;}
	
	public String SandboxEmailAddress {get; set;}	    
    
   	public ControllerSetFundingSourceConfirmed (){    
		AccountId = '';
		EmailAddress = '';
		FundingSourceKey = ''; 	
		SandboxEmailAddress = '';	      		
   	}
   	
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        Pagereference page = null;
        
        SetFundingSourceConfirmedRequest = new PPSetFundingSourceConfirmedRequest(CommonParametersObjName);        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        SetFundingSourceConfirmedRequest.AccountId = AccountId;
        SetFundingSourceConfirmedRequest.EmailAddress = EmailAddress;
        SetFundingSourceConfirmedRequest.FundingSourceKey = FundingSourceKey;
                
        try{
        	
			SetFundingSourceConfirmedResponse = toolkit.setFundingSourceConfirmed(SetFundingSourceConfirmedRequest);			
            ResponseEnvelope = SetFundingSourceConfirmedResponse.getResponseEnvelope();
            isDisplay = true;        	
        	
        }catch(PPFaultMessageException ex) {

           	System.debug('PPFaultMessageException =>' + ex);
            ResponseEnvelope = ex.ResponseEnvelope;
            isErr = true ;
            List<PPErrorData> errlist = ex.ErrorList;
            for( PPErrorData err: errList ){
            	MainMessage += err.ErrorId + ' : ' + err.Message +'<br>';
            }
        	        	       	
        }catch(System.Exception e){
        	
        	MainMessage = e.getmessage();
        	
        }           	                        
        return page;
    }
   	
}