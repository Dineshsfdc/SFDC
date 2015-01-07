trigger myproducts on Product2 ( after update ) 
{

      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
      User Usr = new User();
      Usr = [SELECT Id,email FROM User WHERE Id = : UserInfo.getUserId()];
  
     for (Product2 myProduct : Trigger.new)  
    {
     if(myProduct.stock__c<10)
     {
      String userEmail = usr.email;
      
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
     
      String[] toAddresses = new String[] {userEmail}; 
      mail.setToAddresses(toAddresses); 
      mail.setSaveAsActivity(false);
      mail.setTemplateId('00Xi0000000K0U3');
      mail.setTargetObjectId(Usr.id);
      mails.add(mail);
    }
  }
  if(!mails.isEmpty())
   {
      Messaging.SendEmail(mails);
   }
}