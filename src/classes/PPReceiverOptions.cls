global class PPReceiverOptions {

    global String Description {get; set;}
    
    global String CustomId {get; set;}
    
    global PPInvoiceData InvoiceData {get; set;}
    
    global PPReceiverIdentifier Receiver {get; set;}
    
    global PPReceiverOptions() {
    	Description = '';
    	CustomId = '';
    	InvoiceData = new PPInvoiceData();
    	Receiver = new PPReceiverIdentifier();
    }
    

}