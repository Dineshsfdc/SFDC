public class casecon {
public string id{get;set;}
 public casecon(ApexPages.StandardController controller) 
 {
  
 }
 public pagereference caseclose()
 {
 id = apexpages.currentpage().getparameters().get('id');
 pagereference pr = new pagereference('https://na15.salesforce.com/'+id+'/e?cas7=Closed&retURL=%2F'+id);
 pr.setredirect(true);
 return pr;
 }
 
}