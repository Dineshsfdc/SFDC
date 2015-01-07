global class BatchUpdateAddress2 implements database.batchable<sobject>
{
  string query;
  global Database.querylocator start(Database.BatchableContext BC)    
  
  {

      String empty = '';
      Query = 'Select id, MailingStreet, Address_Line_2__c from contact where Address_Line_2__c != Null';   
      return Database.getQueryLocator(query);
  }
   

    global void execute(Database.BatchableContext BC, List<contact> con){
       List<contact> updatecon = new List<contact>();
    
        
       for(contact conx : con){
           try {

           conx.MailingStreet = conx.MailingStreet + ' ' + conx.Address_Line_2__c ; 
           updatecon.add(conx); 
                 } 
          catch(Exception e) {
        System.debug('The following exception has occurred: ' + e.getMessage());
      } 

       }
       
       update updatecon;
    
    }
    global void finish(Database.BatchableContext BC){
    }
}