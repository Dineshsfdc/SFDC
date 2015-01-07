@istest
public class testwebservice
{
 public static testmethod void m1()
 {
  
    Account acct = new Account(Name = 'Acc1'); 
    insert acct;

    Contact con = new Contact(FirstName = 'f1',LastName = 'l1',AccountId = acct.Id);
    insert con;   
         
    Campaign cm = new Campaign(Name = 'Camp',IsActive = true);            
    insert cm;

    CampaignMember cm1 = new CampaignMember(Contactid = con.Id,Campaignid = cm.Id);
    insert cm1;
  
  BMZPostProcessor.processCampaignData();
  BMZPostProcessor.processEmailCampaignData();
 }
}