public with sharing class student {

    

    public student__c stud { get; set; }
    
            
            public student(ApexPages.StandardController controller)
            {
            stud = new student__c();
            stud= (student__c)controller.getRecord();
        }
      
      
      
            
   


    public PageReference save() {
        
       student__c stud1 = new student__c();
        upsert stud;
       pagereference ref;
        //ref = new pagereference('/apex/sample?'+stud.id);
//        ref = new pagereference('/apex/sample?');
          ref = new pagereference('/');
        ref.setredirect(true);
        return ref;   
        

       }

}