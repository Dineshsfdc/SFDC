public class callrestcontroller
 { 
       public decimal value { get; set; }
       public decimal  result { get; set; }
       public string op;
       
       public PageReference centof()
      {
         op = 'ctof';
         result=getresult(value,op);
         return null;
      }
       public PageReference fartoc()
      {
         op = 'ftoc';
         result=getresult(value,op);
         return null;
      }
      
      public static decimal getresult(decimal value,string op)
      {
          HttpRequest req = new HttpRequest();
          Http http = new Http();
          req.setMethod('GET');
          String url = 'https://na15.salesforce.com/services/apexrest/Account?v1='+value+'&op='+op;
          req.setEndpoint(url);
          req.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
          HTTPResponse resp = http.send(req);
          return decimal.valueof(resp.getbody());
       }
  }