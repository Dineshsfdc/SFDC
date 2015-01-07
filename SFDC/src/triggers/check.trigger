trigger check on amount__c (after insert,after update) {
amount__c a = trigger.new[0];
list<amount__c> amt = new list<amount__c>();
if(a.amount__c>50000){
account__c acc=[Select type__c,name__c from account__c where id__c=:a.sid__c];
acc.type__c='Featured';
update acc;
}
}