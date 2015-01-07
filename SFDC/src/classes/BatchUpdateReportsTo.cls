global class BatchUpdateReportsTo implements database.batchable<sobject>
{
  string query;
  global Database.querylocator start(Database.BatchableContext BC)    
  
  {
      String myStatus = 'Active';
      String empty = '';
      Query = 'Select id,ReportsToId,Manager_Employee_ID__c from contact where EE_Status__c = :myStatus AND Manager_Employee_ID__c != null AND Manager_Employee_ID__c != :empty ';   
      return Database.getQueryLocator(query);
  }
   

    global void execute(Database.BatchableContext BC, List<contact> con){
       List<contact> updatecon = new List<contact>();
    
        
       for(contact conx : con){
           try {
           Contact mgr = [ select Id, ReportsToId from Contact where Employee_ID__c = :conx.Manager_Employee_ID__c LIMIT 1];
           conx.ReportsToId = mgr.Id; 
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