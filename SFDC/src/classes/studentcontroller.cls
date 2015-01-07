public with sharing class studentcontroller 
{
public student__c st{get;set;}
public staff__c staff{get;set;}
public studentcontroller()
{
 st = new student__c();
}
public void getval()
{
 staff =[select name from staff__c where id=:st.mentor__C];
 st.name__C = staff.name;
 
}
 
}