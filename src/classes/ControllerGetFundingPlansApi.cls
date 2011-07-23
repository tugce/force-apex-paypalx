global class ControllerGetFundingPlansApi {
	
	public String MainMessage{get;set;}	
	public Boolean isDisplay{get;set;}	
	public Boolean isErr{get;set;}
	
	public PPResponseEnvelope RespEnvp{get;set;}
	
    public String CommonParametersObjName{get;set;}    
    public String APICredentialObjName{get;set;}
    
   public String PayKey {get;set;}
   
   public PPGetFundingPlansRequest GetFundingPlansRequest{get;set;}   
   public PPGetFundingPlansResponse GetFundingPlansResponse{get;set;}
   
   public PPFundingPlan OnePlan{get;set;}
   
   public ControllerGetFundingPlansApi(){
    	
    	OnePlan = new PPFundingPlan();
    }
       
   public Pagereference apply(){ 
   	
    	MainMessage = '';    	
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        try{
        	
			// create request envelope and set the common request parameters
	        GetFundingPlansRequest = new PPGetFundingPlansRequest(CommonParametersObjName);
	        GetFundingPlansRequest.PayKey = PayKey;
	        
	        GetFundingPlansResponse = toolkit.getFundingPlans(GetFundingPlansRequest);
	        
        	for(Integer index=0;index < GetFundingPlansResponse.FundingPlanList.size();index++){
        		OnePlan = GetFundingPlansResponse.FundingPlanList.get(index);
        	}	        
	        	                     	
        	RespEnvp = GetFundingPlansResponse.getResponseEnvelope();
	        	
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