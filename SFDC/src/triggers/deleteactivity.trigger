trigger deleteactivity on event (before delete) 
{
   ActivityTriggerHandler  handler = new ActivityTriggerHandler ();
   handler.beforedelevent(Trigger.old[0]);
}