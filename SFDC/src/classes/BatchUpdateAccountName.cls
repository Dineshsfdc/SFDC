global class BatchUpdateAccountName implements database.batchable<sobject>
{
  string query;
  global Database.querylocator start(Database.BatchableContext BC)    
  
  {
      String myStatus = 'Active';
      String empty = '';
      Query = 'Select id, Accountid from contact where Accountid = null OR Accountid = :empty ';   
      return Database.getQueryLocator(query);
  }
   

    global void execute(Database.BatchableContext BC, List<contact> con){
       List<contact> updatecon = new List<contact>();
    
        
       for(contact conx : con){
           try {
           String VoyaAcct = 'Voya Financial';
           Account voya = [ select Id, Name from Account where Name = :VoyaAcct LIMIT 1];
           conx.AccountId = voya.Id; 
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