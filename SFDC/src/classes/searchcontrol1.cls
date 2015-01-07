public with sharing class searchcontrol1 {
public staff__c bt { get; set; }
 
public searchcontrol1() {
bt=new staff__c();
}

public void result()
{
String para=Apexpages.currentPage().getParameters().get('par'); 

bt = [select salary__c from staff__c where ID=:textdata];
}

public String textData { get; set; }
}