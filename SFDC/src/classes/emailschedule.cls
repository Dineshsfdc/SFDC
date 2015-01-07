global class emailschedule implements schedulable
{
 global void execute(Schedulablecontext sc)
 {
  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  List<Contact> contacts = [ SELECT Id FROM Contact where SLA_date__c >: date.today()];
  EmailTemplate et=[Select id from EmailTemplate where name=:'SLA'];
  for(contact conx: contacts)
  {
   string[] to = new string[]{'dineshkumar1228@gmail.com'};
                    
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   mail.setToAddresses(to);
   mail.setSaveAsActivity(false);
   mail.setTargetObjectId(UserInfo.getUserId());
   mail.setTemplateId(et.id);   
   mails.add(mail); 
  }
  if(!mails.isEmpty())
  {
    Messaging.SendEmail(mails);
  }
}
}