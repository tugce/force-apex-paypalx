global class PPInvoiceData {
	
	global decimal TotalTax  {get; set;}	
	global decimal TotalShipping  {get; set;}	
	global List<PPInvoiceItem> Item {get; set;}
		
	// Constructor
    global PPInvoiceData() {
        TotalTax = 0.0;
        TotalShipping = 0.0;
        Item = new List<PPInvoiceItem>();
    }

}