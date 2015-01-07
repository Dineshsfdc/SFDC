global class UpdateContactfield implements database.batchable<sobject>
{
  string query;
  global Database.querylocator start(Database.BatchableContext BC)    
  
  {
      Query = 'Select id,Reports_to__c,Manager_empID__c from contact';   
      return Database.getQueryLocator(query);
  }
   

    global void execute(Database.BatchableContext BC, List<contact> con){
       List<contact> updatecon = new List<contact>();
  
       for(contact conx : con){
           conx.Reports_to__c = conx.Manager_empID__c; 
           updatecon.add(conx); 
       }
       update updatecon;
    }
    global void finish(Database.BatchableContext BC){
    }
}