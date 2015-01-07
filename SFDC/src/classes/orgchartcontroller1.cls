public class orgchartcontroller1
{ 
     // public account acc{get;set;}
     // public list<account> acc1{get;set;}
      // public orgchartcontroller(ApexPages.StandardController controller){
    //   acc =[select id,ReportsTo__c,name from account where id=:Apexpages.currentpage().getparameters().get('id')];
    //   acc1 =[select id,name,ReportsTo__c from account where ReportsTo__c =: acc.ReportsTo__c]; 
   
   Public List<cNodes> hierarchy;
   
  public orgchartcontroller1(ApexPages.StandardController controller) { 
   
    hierarchy = new List<cNodes>();
    
    list<account> reptolist = new list<account>();
    list<string> repid = new list<string>();
    reptolist = [select id,ReportsTo__c,name from account where ReportsTo__c!=null];
    for(account acc : reptolist)
    {
     repid.add(acc.ReportsTo__c);
    }
    
    List<Account> tempparent = [Select Id,Name from Account where id in : repid];
    system.debug('*******tempparent******'+tempparent);
    
    for (Integer i =0; i< tempparent.size() ; i++)
    {
        List<account> tempchildren = [Select Id,name from account where ReportsTo__c= :tempparent[i].Id];
         system.debug('*******tempchildren******'+tempchildren);
        hierarchy.add(new cNodes(tempparent[i],tempchildren));
     }   
     
    
     system.debug('*******hierarchy******'+hierarchy);
   // return hierarchy;
 }   
  
  Public List<cNodes> getmainnodes()
  {
   return hierarchy;
  }
 
       
/*wrapper class*/       
public class cNodes
{

 public List<account> parent {get; set;}
 Public Account gparent {get;set;}

 public cNodes(Account  gp, List<account> p)
 {
     parent = p;
     gparent = gp;
 }
}
/* end of Wrapper class */ 


}



//Public List<cNodes> getmainnodes()
//{
   
//}