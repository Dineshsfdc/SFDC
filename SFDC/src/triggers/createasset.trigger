trigger createasset on Opportunity (after update) {

  opportunity opp = trigger.new[0];
  opportunitylineitem oppl = new opportunitylineitem();
  product2 p =new product2();
  OpportunityContactRole contactrole = new OpportunityContactRole();
  if(opp.StageName == 'Closed Won')
  {
   
   oppl = [select id,name,ProductCode,product2id,Quantity from opportunitylineitem where Opportunityid = :opp.id limit 1];
   contactRole =[select ContactID from OpportunityContactRole where IsPrimary = true and OpportunityId = :opp.id];
   Asset a=new asset();
   a.name='a1';
   a.accountid = opp.accountid;
   a.product2id = oppl.product2id;
   a.contactid = contactrole.contactid;
   insert a;
  }
  
  
  
}