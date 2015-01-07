global class SendeMailinBatch 
{   
   
  WebService static void SendEmail(string id)  
   {  
       id campaignid = id;
       List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
       list<campaignmember> cm = new list<campaignmember>();
       list<string> toaddress=new list<string>();
      // cm = [select id,Email1__c from campaignmember where campaignid = :campaignid and contactid <>'']; 
        
       campaign cmp = new campaign();
      // cmp = [ select id,Owner_name__c,Owner_email__c from campaign where id = :campaignid ];   
    
       set<string> accownerid = new set<string>();
       integer count =[SELECT count() FROM Contact WHERE Id IN (SELECT ContactId FROM CampaignMember WHERE campaignid = :campaignId AND ContactId != null)];
       if(count>0)
       {
       List<Contact> contacts = [ SELECT Id,Accountid,Account_Owner_ID__c,Account_Owner_Email__c,Name,Phone FROM Contact WHERE Id IN (SELECT ContactId FROM CampaignMember WHERE campaignid = :campaignId AND ContactId != null)];
       
       for(contact conx : contacts)
       {
        accownerid.add(conx.Account_Owner_ID__c);
       }
       system.debug('*****************accownerid in set'+accownerid);
       
       
        list<user> users = new list<user>();
        users = [select id,email from user where id in : accownerid];
       
        String body;
        body = '<html><h1 style=\"text-align:center;\">Contact Information</h1><br/><br/></html>';
        
       
       for(User userx :users)
       {
         for(contact con : contacts)  
         {    
            if(con.Account_Owner_ID__c == userx.id)
            {
              body = body+'<html><table border="2" align=\"center\"><tr><td>Contact Name</td><td>' + con.Name + '</td></tr><tr><td>phone</td><td>' + con.Phone + '</td></tr></table></html>';
              System.debug('HTML is ' + body);
            }
          }
            if(userx.email!=null)
            { 
               toaddress.add(userx.email);
               
              Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
              attach.setContentType('application/pdf');
              attach.setFileName('Contact.pdf');
              attach.Body = Blob.toPDF(body);
          
              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              mail.setSubject('Email Notification');
              mail.setHtmlBody('Dear Sir /Madam,<br/><br/>Please find the campaign member details that associated with you.');
              mail.setToAddresses(toaddress);
              system.debug('*******toaddress'+toaddress);
              mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });     
              mails.add(mail);  
            }
              body = '<html><h1 style=\"text-align:center;\">Contact Information</h1><br/><br/></html>';
              toaddress.clear();
          }
            system.debug('*******mail'+mails);
            system.debug('*******mailcount'+mails.size());
        }
           if(!mails.isEmpty())
           {
              Messaging.SendEmail(mails);
           }
         }
       }