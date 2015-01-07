// ****** This batch apex updates the all contact records.

global class BatchUpdatecontact implements database.batchable<sobject> // Batch apex implements the interface database.batchable
{
  string query;
  global Database.querylocator start(Database.BatchableContext BC)  
  
  //Database.querylocator -execute the query and return the records.
  //start method 
  {
        Query = 'Select id,firstname from contact';   
   // define the soql query
        return Database.getQueryLocator(query);
   // execute the query and return results to the execute method , this start method contains the records that passed to the execute method
   }
   
   // list contains the records that passed from start method
   // this method contains the execution logic.
 
    global void execute(Database.BatchableContext BC, List<contact> con){
       List<contact> updatecon = new List<contact>();
   //loop through the list, update each record in contact object.
       for(contact conx : con){
           conx.firstname = conx.firstname+'-Processed by batchable'; 
           updatecon.add(conx); 
       }
 
       update updatecon;
    }
     
    global void finish(Database.BatchableContext BC){
    }
}