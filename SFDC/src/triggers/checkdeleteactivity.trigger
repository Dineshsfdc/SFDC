trigger checkdeleteactivity on Task (before delete) 
{
   ActivityTriggerHandler  handler = new ActivityTriggerHandler ();
   handler.beforedelete(Trigger.old[0]);
}