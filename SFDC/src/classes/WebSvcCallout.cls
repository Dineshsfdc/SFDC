public class WebSvcCallout {  
    public static void callgetTpaDetailsByTpaCode() {  
        TPAWebServiceCrmIngCom.TPALookUpPort sample = new TPAWebServiceCrmIngCom.TPALookUpPort();  
        sample.endpoint_x = 'http://esalesforceservices.intg.apptoapp.net:80/esalesforceservices/TPALookUpService';  
          
        // This invokes the EchoString method in the generated class   
      
        sample.getTpaDetailsByTpaCode();  
         
    }     
}