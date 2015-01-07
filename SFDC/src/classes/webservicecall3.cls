public class webservicecall3
{
 public string msg{get;set;}
 public string dispmsg{get;set;}
 public pagereference display()
 {
  soapmywebservice1.mywebservice1 st = new soapmywebservice1.mywebservice1();
  st.SessionHeader = new soapmywebservice1.SessionHeader_element();
  st.SessionHeader.sessionId = UserInfo.getSessionId();
  
  dispmsg = st.newaccount(msg);
  return null;
 }
}