public class accountcontact 
{
public account ac;
 public accountcontact(ApexPages.StandardController controller) 
 {
   ac = (Account)controller.getrecord();
   acclist = [select id,account.name,(select name,firstname,lastname from account.contacts) from account];
 }
  list<account> acclist = new list<account>();
   list<account> acclist1 = new list<account>();
  public list<account> getaccnt()
  {
   return acclist;
  }
}