public class ControllerCancelPreapprovalApi {
    
    public String MainMessage										{get;set;}
    
    public PPCancelPreapprovalRequest CancelPreapprovalRequest		{get;set;}
    public PPCancelPreapprovalResponse CancelPreapprovalResponse	{get;set;}
    public PPResponseEnvelope respEnvp{get;set;}
    
    public Boolean isDisplay{get;set;}
    public PPResponseEnvelope ResponseEnvelope{get;set;}
    public Boolean isErr{get;set;}
    
    public ControllerCancelPreapprovalApi(){
        CancelPreapprovalRequest=new PPCancelPreapprovalRequest('REQ-PARAMS1');
        CancelPreapprovalResponse=new PPCancelPreapprovalResponse();
    }
    
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        Pagereference page = null;
           
        // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit('SandboxCert');
        
        try {
        	System.Debug(Logginglevel.INFO, '==>Request' + CancelPreapprovalRequest);
            CancelPreapprovalResponse = toolkit.cancelPreapproval(CancelPreapprovalRequest);
            System.Debug(Logginglevel.INFO, '==>response' + CancelPreapprovalResponse);
            respEnvp = CancelPreapprovalResponse.getResponseEnvelope();
            isDisplay=true;
        } catch (PPFaultMessageException ex) {
        	System.debug('PPFaultMessageException =>' + ex);
            respEnvp = ex.ResponseEnvelope;
            isErr = true ;
            List<PPErrorData> errlist = ex.ErrorList;
                
            for( PPErrorData err: errList ){
            	MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';
            }
       }catch(System.Exception e){
        	MainMessage = e.getmessage();
       }    
       return page;
    }
    
    
}