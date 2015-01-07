trigger SetRemainderoff on Task (before insert) 
{
  task t = trigger.new[0];
  task t1 = new task();
  if(t.Subject == 'call' && t.who.type == 'contact')
  {
   t1 = [select id, Subject,who.id,who.type,IsReminderSet from task where id=:t.id];
   t1.IsReminderSet =false;
  }
  
}