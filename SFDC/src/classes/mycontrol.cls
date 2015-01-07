public with sharing class mycontrol 
{
   public List<student__c> searchResults {get;set;}
   public string searchText {get;set;}
   public mycontrol (ApexPages.StandardController controller) { }
    public PageReference search() 
    {
      String qry = 'select mark1__c, mark2__c from student__c ' + 'where name LIKE \'%'+searchText+'%\'';
      searchResults = Database.query(qry);
      return null;
    }
   public pagereference save()
    {
    upsert searchresults;
    return null;
    }
     public pagereference delete1()
    {
    delete searchresults;
    return null;
    }
 }