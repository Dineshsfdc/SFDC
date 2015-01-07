trigger t3 on Student__c (after delete){
if (Trigger.isDelete) {
 for(Student__c a: Trigger.old)
      if (a.name == 'suresh') 
        a.name.addError('suresh deleted');
  } 

}