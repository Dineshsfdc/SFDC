@isTest  
global class WebServiceMockImpl implements WebServiceMock {  
   global void doInvoke(  
           Object stub,  
           Object request,  
           Map<string, object> response,  
           String endpoint,  
           String soapAction,  
           String requestName,  
           String responseNS,  
           String responseName,  
           String responseType) {  
       TPAWebServiceCrmIngCom.arrayList respElement = new TPAWebServiceCrmIngCom.arrayList();  
      // respElement.result = 'Mock response';  
       response.put('response_x', 'Mock response');   
   } 
   
}