global class PPInvoiceItem {
	
	global String ItemName  {get; set;}	
	global String Identifier {get; set;}	
	global decimal Price {get; set;}	
	global decimal ItemPrice {get; set;}	
	global Integer ItemCount {get; set;}
	
    global PPInvoiceItem() {    	
    	ItemName = '';
    	Identifier = '';
    	Price = 0.0;
    	ItemPrice = 0.0;
    	ItemCount = 0;    	
    }
	

}