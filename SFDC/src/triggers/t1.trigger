trigger t1 on staff__c (before insert) {
staff__c[] stafflist = Trigger.new;
       Set<string> IDset = new Set<string>();
       for(staff__c s : stafflist)
       {
        IDset.add(s.ID__c);
       }
       List<staff__c> duplicateStudentList = new List<staff__c>(); 
       List<staff__c> duplicateStaffList = [Select s.Name, s.ID__c From staff__c s
     where s.ID IN :IDset];

       Set<string> duplicatestaffid = new Set<string>();
       for(staff__c s : duplicateStaffList)
       {
        duplicatestaffid.add(s.ID__c);
       }
       for(staff__c s : staffList)
       {
            if(duplicatestaffid.contains(s.ID__c))
            {
             s.ID__c.addError('Record already exist with same Id');
            }
       }
}