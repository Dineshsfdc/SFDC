public class webservicecall2
{
 public string name{get;set;}
 public pagereference save()
 {
  soapSforceComSchemasClassMywebservi.mywebservice st = new soapSforceComSchemasClassMywebservi.mywebservice();
  st.SessionHeader = new soapSforceComSchemasClassMywebservi.SessionHeader_element();
  st.SessionHeader.sessionId = UserInfo.getSessionId();

  st.newaccount(name);
  return null;
 }
}