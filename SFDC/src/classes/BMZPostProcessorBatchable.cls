global class BMZPostProcessorBatchable implements Database.Batchable<sObject> 
{

     global string query1;
     global integer bsize;
     global BMZPostProcessorBatchable(String query,integer s)
    {
             query1 = query;
             bsize =s;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
         //String query = query;
        return Database.getQueryLocator(query1);
    }
    global void execute(Database.BatchableContext BC, List<Sobject> scope) {
         for(Sobject a : scope)
         {
                system.debug('*********'+a);    
         }
       //  update scope;
    }   
     global void finish(Database.BatchableContext BC) {
    }
}