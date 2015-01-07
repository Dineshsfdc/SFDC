public with sharing class accountcontroller {
    public Account acc{get;set;}
    public accountcontroller(ApexPages.StandardController controller) 
    {
     acc = new Account();
     acc = (account)controller.getRecord();

    }
    public pagereference save()
    {
     insert acc;
     pagereference ref = new pagereference('/apex/accountdetail?id='+acc.id);
     ref.setredirect(true);
     return ref;
    }
    public PageReference SaveAndNew() {
    // code to do saving goes here
    insert acc;
    PageReference pageRef = new PageReference('/001/e');
    pageref.setredirect(false);
    return pageRef;
}

}