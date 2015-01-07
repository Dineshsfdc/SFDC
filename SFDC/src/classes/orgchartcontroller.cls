public class orgchartcontroller
{ 
public account acc{get;set;}
public list<account> acc1{get;set;}
    public orgchartcontroller(ApexPages.StandardController controller) {
       acc =[select id,ReportsTo__c,name from account where id=:Apexpages.currentpage().getparameters().get('id')];
       acc1 =[select id,name,ReportsTo__c from account where ReportsTo__c =: acc.ReportsTo__c]; 
    }

}