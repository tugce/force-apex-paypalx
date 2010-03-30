public class ControllerPreapprovalDetailApi {

	

	public String MainMessage										{get;set;}

	

	

	public PPPreapprovalDetailsRequest PreapprovalDetailRequest		{get;set;}

	public PPPreapprovalDetailsResponse PreapprovalDetailResponse	{get;set;}

	public PPResponseEnvelope respEnvp								{get;set;}

	

	public Boolean isDisplay										{get;set;}

	public PPResponseEnvelope ResponseEnvelope						{get;set;}

	public Boolean isErr											{get;set;}

	

	public ControllerPreapprovalDetailApi(){

		PreapprovalDetailRequest=new PPPreapprovalDetailsRequest('REQ-PARAMS1');

		PreapprovalDetailResponse=new PPPreapprovalDetailsResponse();

	}
	
	public Pagereference apply(){

		MainMessage = '';

		isDisplay = false;	

		isErr = false ;

	   	Pagereference page=null;
	    // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit('SandboxCert');


       	try {

	  		System.Debug(Logginglevel.INFO, '==>Request' + PreapprovalDetailRequest);

        	PreapprovalDetailResponse = toolkit.preapprovalDetails(PreapprovalDetailRequest);

      		System.Debug(Logginglevel.INFO, '==>response' + PreapprovalDetailResponse);

      		respEnvp = PreapprovalDetailResponse.getResponseEnvelope();

      		isDisplay = true;

      	} catch (PPFaultMessageException ex) {

        	System.debug('PPFaultMessageException =>' + ex);

            respEnvp = ex.ResponseEnvelope;

            isErr = true ;

            List<PPErrorData> errlist = ex.ErrorList;

	        for(PPErrorData err: errList ){

            	MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';

			}

	     }catch(System.Exception e){

         	MainMessage = e.getmessage();

         }  

	   return page;

	}

}