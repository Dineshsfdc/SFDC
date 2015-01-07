//change 2015
trigger t on staffdob__c (after delete) {
if(trigger.isDelete)
{
List<staff1__c> c=new List<staff1__c>();
for(staffdob__c a:Trigger.old)
{
staff1__c c1=new staff1__c(salary__c=a.age__c);
c.add(c1);
}
insert c;
}
}