global class UpdateAccountBatch implements Database.Batchable<sObject>{
    String query;
     
    global Database.querylocator start(Database.BatchableContext BC){
        Query = 'Select id,name,scheduleupdate__c from account__c';   
        return Database.getQueryLocator(query);
    }
 
    global void execute(Database.BatchableContext BC, List<account__c> scope){
       List<account__c> accList = new List<account__c>();
 
       for(account__c s : scope){
           s.scheduleupdate__c = 'yes'; 
           accList.add(s); 
       }
 
       update accList;
    }
     
    global void finish(Database.BatchableContext BC){
    }
}