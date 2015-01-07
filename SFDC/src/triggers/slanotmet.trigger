trigger slanotmet on Contact (after insert,after update) 
{
 contact c = trigger.new[0];
 EmailTemplate et=[Select id from EmailTemplate where name=:'SLA'];
 if(c.SLA_date__c > date.today())
 {
   string[] to = new string[]{'dineshkumar1228@gmail.com'};
                    
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   mail.setToAddresses(to);
   mail.setSaveAsActivity(false);
   //mail.setTargetObjectId(UserInfo.getUserId());
   mail.settargetobjectid(c.id);
  
   mail.setTemplateId(et.id);   
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 }
}