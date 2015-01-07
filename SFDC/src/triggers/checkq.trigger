trigger checkq on vehicle__c (after insert) 
{
 
 list<vehicle__c> vs = new list<vehicle__c>();
 list<vehicle__c> vs1 = new list<vehicle__c>();
 vs = [select id from vehicle__c];
 vs1 = [select name  from vehicle__c where id in:vs];
 system.debug(+vs1);
 

}