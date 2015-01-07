public class Dynamicworkflowcontroller {
public list<selectoption> val{get;set;}
public list<String> lstfields;
public rule__C rule;
public  Dynamicworkflowcontroller(ApexPages.StandardController controller) 
 {
 rule=(rule__c )controller.getRecord();       
 }
 public list<selectoption> getval()
 {      system.debug('***Va;');
        val = new list<Selectoption>();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('1','1'));
        options.add(new SelectOption('2','2'));
        options.add(new SelectOption('3','3'));
        options.add(new SelectOption('4','4'));
        options.add(new SelectOption('5','5'));
        system.debug('*********'+options);
               return options;
               
 }
}