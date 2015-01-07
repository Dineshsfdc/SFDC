trigger Updatestockinproduct on Opportunity (after update) 
{
  opportunity opp = trigger.new[0];
  list<opportunitylineitem> oppl = new list<opportunitylineitem>();
  list<string> prodcode = new list<string>();
   map<string,decimal> prodcodemap = new map<string,decimal>();
   
   
  if(opp.StageName == 'Closed Won')
  {
   
   oppl = [select id,name,ProductCode,Quantity from opportunitylineitem where Opportunityid = :opp.id];
  }
  for(opportunitylineitem oppx : oppl)
  {
   prodcode.add(oppx.productcode);
   prodcodemap.put(oppx.productcode,oppx.Quantity);
  }
  list<product2> prod = new list<product2>();
  list<product2> updateprod = new list<product2>();
  prod = [select id,name,stock__c,ProductCode from product2 where productcode in : prodcode];
  for(product2 prdx : prod)
  {
   string ss = prdx.productcode;
   if(prodcodemap.containskey(ss) == true)
   {
    decimal value = prodcodemap.get(ss);
    if(prdx.stock__c > 0)
    {
      prdx.stock__c = prdx.stock__c - value;
    }
    updateprod.add(prdx);
   }
  }
   update updateprod;
   
   
  
}