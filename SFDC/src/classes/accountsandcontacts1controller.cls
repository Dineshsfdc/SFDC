public class accountsandcontacts1controller 
 {
  Public string recordId {get;set;}
  Public boolean cse {get;set;}
  Public boolean it {get;set;}
  Public boolean ece {get;set;}
  public string result{get;set;}
  
  public List<contact> contacts{get;set;}
  
  public accountsandcontacts1controller(ApexPages.StandardController controller) 
  {
    recordId = ApexPages.CurrentPage().getparameters().get('id');
    contacts=[select id,name,title,email,phone from contact limit 4]; 
  }
  public pagereference view()
  {
  integer l = 8;
  blob bkey = crypto.generateAESkey(128);
  string key =encodingutil.converttohex(bkey);
  result = key.substring(0,l); 
  
  return null;
  }
}