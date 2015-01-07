public class controlmail 
{
    public string to{get;set;}
    public string cc{get;set;}
    public string sub{get;set;}
    public string body{get;set;}
      String[] ccaddr;
    
    public PageReference send() 
    {
     list<contact> con =[select id from contact limit 1]; 
    // list<id> conids = new list<id>();
    // conids.add(con.id);
      EmailTemplate et=[Select id from EmailTemplate where name=:'SLA'];
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] to = new String[]{to};
          if(cc!=NULL && cc.trim() != '')
    {
     ccaddr=cc.split(',', 0);
     
    }
    else
    ccaddr=NULL;
    
         
         mail.setToAddresses(to);
         mail.setCcAddresses(ccaddr);
         mail.setSubject(sub); 
         mail.setHtmlBody(body);
        // mail.setTemplateId(et.id);  
      // mail.settargetobjectid(con.id);
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
         
         return null;
    }

}