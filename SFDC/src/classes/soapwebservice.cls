global class soapwebservice
 {
  
  webservice static decimal calculate(decimal value,string op)
  {
   decimal res;
   decimal val = value;
   string opp = op;
   if(op == 'ctof')
   {
     res = (1.8*val)+32;
   }
    else
    if(op == 'ftoc')
   {
     res = 0.555555*(val-32);
   }
    return res;
 }
 }