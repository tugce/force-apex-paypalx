public class ControllerAddPaymentCardApi {
	
    public String MainMessage						{get;set;}
    public string SuccessMessage					{get;set;}
    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}

    public Boolean isDisplay						{get;set;}
    public PPResponseEnvelope ResponseEnvelope		{get;set;}
    public Boolean isErr							{get;set;}

    public PPAddPaymentCardRequest 	AddPaymentCardRequest	{get;set;}    
    public PPAddPaymentCardResponse AddPaymentCardResponse {get;set;}
    
	public String AccountId {get; set;}	
	public PPAddress BillingAddress {get; set;}	
	public String CardNumber {get; set;}	
	//public Date	CardOwnerDateOfBirth {get; set;}	
	public String CardType {get; set;}	
	public String CardVerificationNumber {get; set;}	
	public String ConfirmationType {get; set;}	
	public String CreateAccountKey {get; set;}	
	public String EmailAddress {get; set;}	
	public Integer ExpirationDateMonth {get; set;}	
	public Integer ExpirationDateYear {get; set;}	
	public String IssueNumber {get; set;}		
		
	public PPName NameOnCard{get; set;}	
	
	public Integer StartDateMonth{get; set;}	
	public Integer StartDateYear{get; set;}	
	public PPWebOptions WebOptions{get; set;}
	
	public String ExecStatus {get; set;}	
	public String RedirectURL {get; set;}	
	public String FundingSourceKey {get; set;}
	
	public String SandboxEmailAddress {get; set;}		    
	        
   	public List<SelectOption> getCardTypeDropDown(){
        List<selectoption> options = new List<selectoption>();
        options.add(new Selectoption('Visa','Visa'));
        options.add(new Selectoption('MasterCard','MasterCard'));
        options.add(new Selectoption('AmericanExpress','AmericanExpress'));
        options.add(new Selectoption('Discover','Discover'));
        options.add(new Selectoption('SwitchMaestro','SwitchMaestro'));
        options.add(new Selectoption('Solo','Solo'));
        options.add(new Selectoption('CarteAurore','CarteAurore'));
        options.add(new Selectoption('CarteBleue','CarteBleue'));
        options.add(new Selectoption('Cofinoga','Cofinoga'));        
        options.add(new Selectoption('4etoiles','4etoiles'));
        options.add(new Selectoption('CarteAura','CarteAura'));   
        options.add(new Selectoption('TarjetaAurora','TarjetaAurora'));   
        options.add(new Selectoption('JCB','JCB'));
        return options;
    }

   	public List<SelectOption> getConfirmationTypeDropDown(){
   		List<selectoption> options = new List<selectoption>();
   		options.add(new Selectoption('WEB','WEB'));
   		options.add(new Selectoption('NONE','NONE'));
		return options;   		
   	}    
    
    public ControllerAddPaymentCardApi (){
		AccountId = '';	
		BillingAddress = new PPAddress();	
		CardNumber = '';	
		//CardOwnerDateOfBirth = new Date();	
		CardType = '';	
		CardVerificationNumber = '';	
		ConfirmationType = '';	
		CreateAccountKey = '';
		EmailAddress = '';
		ExpirationDateMonth = 0;	
		ExpirationDateYear = 0;
		IssueNumber = '';	
		NameOnCard = new PPName();	
		StartDateMonth = 0;	
		StartDateYear = 0;	
		WebOptions = new PPWebOptions();
		
		ExecStatus ='';
		RedirectURL = '';
		FundingSourceKey = '';
		
		SandboxEmailAddress = '';   	    	
		    	
    }
    
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        
        Pagereference page = null;
        AddPaymentCardRequest = new PPAddPaymentCardRequest(CommonParametersObjName);        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);

		AddPaymentCardRequest.AccountId = AccountId;	
		AddPaymentCardRequest.BillingAddress = BillingAddress ;	
		AddPaymentCardRequest.CardNumber = CardNumber;	
		//CardOwnerDateOfBirth = new Date();	
		AddPaymentCardRequest.CardType = CardType;	
		AddPaymentCardRequest.CardVerificationNumber = CardVerificationNumber;	
		AddPaymentCardRequest.ConfirmationType = ConfirmationType;	
		AddPaymentCardRequest.CreateAccountKey = CreateAccountKey;
		AddPaymentCardRequest.EmailAddress = EmailAddress;
		AddPaymentCardRequest.ExpirationDateMonth = ExpirationDateMonth;	
		AddPaymentCardRequest.ExpirationDateYear = ExpirationDateYear;
		AddPaymentCardRequest.IssueNumber = IssueNumber;	
		AddPaymentCardRequest.NameOnCard = NameOnCard;	
		AddPaymentCardRequest.StartDateMonth = StartDateMonth;	
		AddPaymentCardRequest.StartDateYear = StartDateYear;	
		AddPaymentCardRequest.WebOptions = WebOptions;
		
		AddPaymentCardRequest.SandboxEmailAddress = SandboxEmailAddress;
		
        try{
        	
			AddPaymentCardResponse = toolkit.addPaymentCard(AddPaymentCardRequest);			
            ResponseEnvelope = AddPaymentCardResponse.getResponseEnvelope();
            
            ExecStatus = AddPaymentCardResponse.ExecStatus;
            RedirectURL = AddPaymentCardResponse.RedirectURL;
            FundingSourceKey = AddPaymentCardResponse.FundingSourceKey;
            
            System.debug('***AddPaymentCardResponse=' + AddPaymentCardResponse);
                   	
        	isDisplay = true;
        	        	
        }catch(PPFaultMessageException ex){
        	
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