public class ControllerAddBankAccountApi {
	
    public String MainMessage						{get;set;}
    public string SuccessMessage					{get;set;}
    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
    
    public Boolean isDisplay						{get;set;}
    public PPResponseEnvelope ResponseEnvelope		{get;set;}
    public Boolean isErr							{get;set;}
    
    public PPAddBankAccountRequest 	AddBankAccountRequest	{get;set;}
    
    public PPAddBankAccountResponse AddBankAccountResponse {get;set;}
       
	public String EmailAddress {get; set;}
	public String AccountId {get; set;}	
	public String CreateAccountKey {get; set;}	
	public String BankCountryCode {get; set;}
	public String BankName {get; set;}	
	public String RoutingNumber {get; set;}	
	public String BankAccountType {get; set;}	
	public String BankAccountNumber {get; set;}	
	public String Iban {get; set;}	
	public String Clabe {get; set;}	
	public String BsbNumber {get; set;}	
	public String BranchLocation {get; set;}	
	public String SortCode {get; set;}	
	public String BankTransitNumber {get; set;}	
	public String InstitutionNumber {get; set;}	
	public String BranchCode {get; set;}	
	public String AgencyNumber {get; set;}	
	public String BankCode {get; set;}	
	public String RibKey {get; set;}	
	public String ControlDigit {get; set;}	
	public String TaxIdType {get; set;}	
	public String TaxIdNumber {get; set;}	
	//global Date AccountHolderDateOfBirth {get; set;}	
	public String ConfirmationType {get; set;}	
	public PPWebOptions WebOptions {get; set;}
	
	public String ExecStatus {get; set;}	
	public String RedirectURL {get; set;}	
	public String FundingSourceKey {get; set;}	
		
	public String SandboxEmailAddress {get; set;}		    
    
    public ControllerAddBankAccountApi (){
    	
		EmailAddress = '';
		AccountId = '';	
		CreateAccountKey = '';	
		BankCountryCode = '';
		BankName = '';	
		RoutingNumber = '';	
		BankAccountType = '';	
		BankAccountNumber = '';	
		Iban = '';	
		Clabe = '';		
		BsbNumber = '';	
		BranchLocation = '';	
		SortCode = '';	
		BankTransitNumber = '';	
		InstitutionNumber = '';	
		BranchCode = '';	
		AgencyNumber = '';	
		BankCode = '';	
		RibKey = '';
		ControlDigit = '';	
		TaxIdType = '';
		TaxIdNumber = '';
		ConfirmationType = '';
		WebOptions = new PPWebOptions();
		
		SandboxEmailAddress = '';
		
		ExecStatus ='';
		RedirectURL = '';
		FundingSourceKey = '';    	    	
    }
    
   	public List<SelectOption> getConfirmationTypeDropDown(){
   		List<selectoption> options = new List<selectoption>();
   		options.add(new Selectoption('WEB','WEB'));
   		options.add(new Selectoption('NONE','NONE'));
		return options;   		
   	}
   	
   	public List<SelectOption> getBankAccountTypeDropDown(){
   		List<selectoption> options = new List<selectoption>();
   		options.add(new Selectoption('CHECKING','CHECKING'));
   		options.add(new Selectoption('SAVINGS','SAVINGS'));
   		options.add(new Selectoption('BUSINESS_SAVINGS','BUSINESS_SAVINGS'));
   		options.add(new Selectoption('BUSINESS_CHECKINGS','BUSINESS_CHECKINGS'));
   		options.add(new Selectoption('NORMAL','NORMAL'));
   		options.add(new Selectoption('UNKNOWN','UNKNOWN'));
   		
		return options;   		
   	}      
   	      
    
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        Pagereference page = null;
        
        AddBankAccountRequest = new PPAddBankAccountRequest(CommonParametersObjName);
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
                
		AddBankAccountRequest.EmailAddress = EmailAddress;
		AddBankAccountRequest.AccountId = AccountId;	
		AddBankAccountRequest.CreateAccountKey = CreateAccountKey;	
		AddBankAccountRequest.BankCountryCode = BankCountryCode;
		AddBankAccountRequest.BankName = BankName;	
		AddBankAccountRequest.RoutingNumber = RoutingNumber;	
		AddBankAccountRequest.BankAccountType = BankAccountType;	
		AddBankAccountRequest.BankAccountNumber = BankAccountNumber;	
		AddBankAccountRequest.Iban = Iban;	
		AddBankAccountRequest.Clabe = Clabe;		
		AddBankAccountRequest.BsbNumber = BsbNumber;	
		AddBankAccountRequest.BranchLocation = BranchLocation;	
		AddBankAccountRequest.SortCode = SortCode;	
		AddBankAccountRequest.BankTransitNumber = BankTransitNumber;	
		AddBankAccountRequest.InstitutionNumber = InstitutionNumber;	
		AddBankAccountRequest.BranchCode = BranchCode;	
		AddBankAccountRequest.AgencyNumber = AgencyNumber;	
		AddBankAccountRequest.BankCode = BankCode;	
		AddBankAccountRequest.RibKey = RibKey;
		AddBankAccountRequest.ControlDigit = ControlDigit;	
		AddBankAccountRequest.TaxIdType = TaxIdType;
		AddBankAccountRequest.TaxIdNumber = TaxIdNumber;
		AddBankAccountRequest.ConfirmationType = ConfirmationType ;
		AddBankAccountRequest.WebOptions = WebOptions;
		
		AddBankAccountRequest.SandboxEmailAddress = SandboxEmailAddress; 	
        
        try{
        	        	
			AddBankAccountResponse = toolkit.addBankAccount(AddBankAccountRequest);			
            ResponseEnvelope = AddBankAccountResponse.getResponseEnvelope();
            
            ExecStatus = AddBankAccountResponse.ExecStatus;
            RedirectURL = AddBankAccountResponse.RedirectURL;
            FundingSourceKey = AddBankAccountResponse.FundingSourceKey;
                   	
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