// change jan -07 2015 din

public class Acctest 
{
    public ApexPages.StandardController con;
    public account acc{get;set;}
    public string name{get;set;}  // get - pass values from cont to vf page,set = pass values from vf page to controller
    Account acclist = new Account();
   
    public Acctest(ApexPages.StandardController controller) 
    {
      system.debug('********true');
      
      this.con = controller;    // get the stdcontroller arg and assign it to this.con
      acc = new account();
      acc = (account)controller.getrecord();  // get the account record from vf page
      
      system.debug('******this.con'+con);   //ApexPages.StandardController[account]
      system.debug('******acc'+acc);        // account
      system.debug('**'+acc.name);          //dinesh  
    }
   public pagereference save()
   {  
    system.debug('******before this.con'+con);  //conApexPages.StandardController[account]
    system.debug('****************acc'+acc);    // account
    system.debug('**'+acc.name);                //dinesh 
    
    //this.con.save();  
    insert acc;
   // pagereference ref = new pagereference('/'+acc.id);
    pagereference ref = new ApexPages.StandardController(acc).view();
    ref.setredirect(true);             // save the current values into account object.
    return ref;
  }
  public pagereference saveandnew()
  { 
   //this.con.save();    
   insert acc;
   pagereference ref1 = new ApexPages.StandardController(acc).edit();
   ref1.setredirect(true);
   return ref1;
  }
  public pagereference cancel()
  {
   this.con.cancel();
   return null;
  }
  public pagereference view()
  {
   this.con.view();
   return null;
  }
  public pagereference edit()
  {
   this.con.edit();
   return null;
  }
  public pagereference save1()
  {
     account acct = new account();   //override the standard save fn by custom save code.
     acct.name =acc.name;
     insert acct;
     
     acclist = [select id,name from account where id=:acct.id];
     name = acclist.name;                                        //return the name to the vf page.
     acclist.name = 'test06';
     upsert acclist;
     
     return null;
 }
}