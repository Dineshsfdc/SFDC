// changes on jan 06
public class ActivityTriggerHandler 
{
   Id profileId=userinfo.getProfileId();
   String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
  public void beforedelete(task t)
  {
   if(profilename != 'System Administrator')
   {
    t.adderror('Access Restricted for delete activity');
   } 
  }
  
  public void beforedelevent(Event e)
  {
   if(profilename != 'System Administrator')
   {
    e.adderror('Access Restricted for delete activity');
   } 
  }
}