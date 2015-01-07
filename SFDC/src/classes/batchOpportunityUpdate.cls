global class batchOpportunityUpdate implements Database.Batchable<sObject>
{
global Database.QueryLocator start(Database.BatchableContext BC)
{
String query = 'SELECT Id,Name FROM Opportunity';
return Database.getQueryLocator(query);
}
global void execute(Database.BatchableContext BC, List<Opportunity> scope)
{
for(Opportunity a : scope)
{
a.Name = a.Name + 'Updated';
}
update scope;
}
global void finish(Database.BatchableContext BC)
{
}
}