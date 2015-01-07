trigger updatevalue on Payment__c (after insert,after update) 
{
 list<string> lstname = new list<string>();
 list<Update_from_Payment__c> updatelst = new list<Update_from_Payment__c>();
 map<string,decimal> paymap = new map<string,decimal>();
 
 for(Payment__c px : trigger.new)
 {
  lstname.add(px.name);
  paymap.put(px.name,px.amount__C);
 }
 
 list<Update_from_Payment__c> up = new list<Update_from_Payment__c>([select name,amount__c from Update_from_Payment__c where name in : lstname]);
 
 if(up != null)
 {
  for(Update_from_Payment__c upx : up)
  {
    string ss = upx.name;
    if(paymap.containskey(ss) == true)
    {
     decimal amt = paymap.get(ss);
     upx.amount__C = amt;
     updatelst.add(upx);
    }
  }
  update updatelst; 
 }
}