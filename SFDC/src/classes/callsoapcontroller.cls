public class callsoapcontroller
 { 
       public decimal value { get; set; }
       public decimal  result { get; set; }
       public string op;
       
       public PageReference centof()
      {
         op = 'ctof';
         Soapwebservicefromwsdl.soapwebservice soapws = new Soapwebservicefromwsdl.soapwebservice();
         soapws.SessionHeader = new Soapwebservicefromwsdl.SessionHeader_element();
         soapws.SessionHeader.sessionId = UserInfo.getSessionId();
         result=soapws.calculate(value,op);
         return null;
      }
       public PageReference fartoc()
      {
         op = 'ftoc';
         Soapwebservicefromwsdl.soapwebservice soapws1 = new Soapwebservicefromwsdl.soapwebservice();
         soapws1.SessionHeader = new Soapwebservicefromwsdl.SessionHeader_element();
         soapws1.SessionHeader.sessionId = UserInfo.getSessionId();
         result=soapws1.calculate(value,op);
         return null;
      }
 }