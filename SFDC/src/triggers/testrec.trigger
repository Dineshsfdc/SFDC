trigger testrec on test__c (after insert) 
{
  Test__c t = trigger.new[0];
  Opportunity Opp = new Opportunity();
  Opp.Name = t.Name;
  insert opp;

}