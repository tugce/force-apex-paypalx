public class ControllerSetPaymentOptionsApi {
	
	public String MainMessage{get;set;}	
	public Boolean isDisplay{get;set;}	
	public Boolean isErr{get;set;}
    public PPSetPaymentOptionsRequest SetPaymentOptionsRequest{get;set;}   
    public PPSetPaymentOptionsResponse SetPaymentOptionsResponse{get;set;}
    public PPResponseEnvelope RespEnvp{get;set;}
		
    public String CommonParametersObjName{get;set;}    
    public String APICredentialObjName{get;set;}
    
	public String PayKey {get;set;}	
	public String EmailHeaderImageUrl {get;	set;}
	public String EmailMarketingImageUrl {get;set;}
	public String HeaderImageUrl {get;set;}
	public String BusinessName {get;set;}
	public String CountryCode {get;set;}
	public String DisplayName {get;set;}
	public String Email {get;set;}
	public String FirstName {get;set;}
	public String LastName {get;set;}
	public String InstitutionCustomerId {get;set;}
 	public String InstitutionId {get;set;}
 	public String ShippingAddressId {get;set;}
 	public String RequireShippingAddressSelection {get;set;} 	
 	public String SharePhoneNumber{get;set;}
 	public String ShareAddress{get;set;}
 	
    public PPReceiverOptions ReceiverOptionsOne {get; set;}  
    
    public PPInvoiceItem InvoiceItemOne {get; set;}  
      	
 	public List<PPInvoiceItem> invoiceItems {get; set;}
 	
 	public List<PPReceiverOptions> receiverOptionsList {get; set;}
 	
 	             
    public ControllerSetPaymentOptionsApi(){    	
    	SetPaymentOptionsResponse = new PPSetPaymentOptionsResponse();
    	ReceiverOptionsOne = new PPReceiverOptions();
    	InvoiceItemOne = new PPInvoiceItem(); 
    	
    	invoiceItems = new List<PPInvoiceItem>();    	
    	receiverOptionsList = new List<PPReceiverOptions>();
    }
    

    public Pagereference apply(){
    	
    	MainMessage = '';
    	
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;
        
		// create request envelope and set the common request parameters
        SetPaymentOptionsRequest = new PPSetPaymentOptionsRequest(CommonParametersObjName);

		SetPaymentOptionsRequest.PayKey = PayKey;
		SetPaymentOptionsRequest.EmailHeaderImageUrl = EmailHeaderImageUrl;
		SetPaymentOptionsRequest.EmailMarketingImageUrl = EmailMarketingImageUrl;
		SetPaymentOptionsRequest.HeaderImageUrl = HeaderImageUrl;
		SetPaymentOptionsRequest.BusinessName = BusinessName;
		SetPaymentOptionsRequest.CountryCode = CountryCode;
		SetPaymentOptionsRequest.DisplayName = DisplayName ;
		SetPaymentOptionsRequest.Email = Email;
		SetPaymentOptionsRequest.FirstName = FirstName ;
		SetPaymentOptionsRequest.LastName = LastName;
		SetPaymentOptionsRequest.InstitutionCustomerId = InstitutionCustomerId;
 		SetPaymentOptionsRequest.InstitutionId = InstitutionId;
 		SetPaymentOptionsRequest.ShippingAddressId = ShippingAddressId;
 		SetPaymentOptionsRequest.RequireShippingAddressSelection = RequireShippingAddressSelection;
 		SetPaymentOptionsRequest.ShareAddress = ShareAddress;
 		SetPaymentOptionsRequest.SharePhoneNumber = SharePhoneNumber;
 		        		
		invoiceItems.add(InvoiceItemOne);
		ReceiverOptionsOne.InvoiceData.Item = invoiceItems;        
        receiverOptionsList.add(ReceiverOptionsOne);
        
        System.debug('***********************************');
        System.debug('Passed the index');        
        System.debug('***********************************');
        
        
        SetPaymentOptionsRequest.ReceiverOptions = receiverOptionsList;
        		    	    	    	                
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        try{
        	
        	System.Debug('==>PayKey' + SetPaymentOptionsRequest.PayKey);
        	
        	SetPaymentOptionsResponse = toolkit.setPaymentOptions(SetPaymentOptionsRequest);
        	
        	System.Debug('*********Response********************');
        	System.Debug(SetPaymentOptionsResponse);
        	System.Debug('*********Response End********************');

        	
        	RespEnvp = SetPaymentOptionsResponse.getResponseEnvelope();  	
        	
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
       
        System.Debug(Logginglevel.INFO, '==>Request' + SetPaymentOptionsRequest);
        System.Debug(Logginglevel.INFO, '==>response' + SetPaymentOptionsResponse);       
           
       return page;
        
    }    	
}