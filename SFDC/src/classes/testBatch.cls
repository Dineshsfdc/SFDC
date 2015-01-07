@isTest
public class testBatch
{
 public static String CRON_EXP = '0 0 0 22 5 ? 2020';
 public static testmethod void m1()
 {
   Account a = new Account(name='Voya Financial');
   insert a;
   
   list<Contact> c = new list<Contact>();
   contact c1= new contact(firstname='c1',lastname='l1',accountid=a.id);
   c.add(c1);
   insert c;
   
   Database.QueryLocator QL;
   Database.BatchableContext BC;
   BatchUpdateAccountName b = new BatchUpdateAccountName();
   QL = b.start(bc);
   b.execute(BC, c);
   b.finish(BC);         
   
   String jobId = System.schedule('ScheduleUpdateAccountName', CRON_EXP, new ScheduleUpdateAccountName());
   CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
   System.assertEquals(CRON_EXP,ct.CronExpression);
   
 }
 public static testmethod void m2()
 {
   
   list<Contact> c = new list<Contact>();
   contact c1= new contact(firstname='c1',lastname='l1',MailingStreet='tn',Address_Line_2__c='addr');
   c.add(c1);
   insert c;
   
   Database.QueryLocator QL;
   Database.BatchableContext BC;
   BatchUpdateAddress2 b = new BatchUpdateAddress2();
   QL = b.start(bc);
   b.execute(BC, c);
   b.finish(BC);         
   
   String jobId = System.schedule('ScheduleUpdateAccountaddress', CRON_EXP, new ScheduleUpdateAddress2());
   CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
   System.assertEquals(CRON_EXP,ct.CronExpression);
   
 }
 public static testmethod void m3()
 {
   contact con = new contact(firstname='con1',lastname='l1',Employee_ID__c='11111');  // Speccify the employee id value based on datatype
   insert con;
   
   list<Contact> c = new list<Contact>();
   contact c1= new contact(firstname='c1',lastname='l1',Manager_Employee_ID__c='11111',EE_Status__c ='Active');  // Speccify the manager employee id value based on datatype
   c.add(c1);
   insert c;
   
   Database.QueryLocator QL;
   Database.BatchableContext BC;
   BatchUpdateReportsTo b = new BatchUpdateReportsTo();
   QL = b.start(bc);
   b.execute(BC, c);
   b.finish(BC);         
   
   String jobId = System.schedule('ScheduleUpdateReportsto', CRON_EXP, new ScheduleUpdateReportsTo());
   CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
   System.assertEquals(CRON_EXP,ct.CronExpression);
   
 }
}