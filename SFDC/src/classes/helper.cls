public class helper
{
  public void check(list<Account> ax)
  {
    for(account a :ax)
    {
    if (a.NumberofLocations__c == null )
    {
    
     a.adderror('value required for no of locations');
    }
    
   }
  }
}