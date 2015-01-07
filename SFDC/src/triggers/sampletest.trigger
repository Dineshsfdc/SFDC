trigger sampletest on Account (before insert) //,after insert,after update,before update) 
{
  Account acc = trigger.new[0] ;
  
  if(acc.name == ' ')
  {
    system.debug('*******name****'+acc.name);
    acc.name = 'dinesh';
  }
 }