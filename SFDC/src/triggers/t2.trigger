trigger t2 on Student__c (before insert,before update) {
if (Trigger.isInsert) {
 for(Student__c a: Trigger.new)
      if (a.name == 'deva') 
        a.name.addError('not valid');
  } 
  if (Trigger.isUpdate) {
    for(Student__c a: Trigger.new)
      if (a.name == 'deva') 
        a.name.addError('Bad name'); // prevent update
     }

}