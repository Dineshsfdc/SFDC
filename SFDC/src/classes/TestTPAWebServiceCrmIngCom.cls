@istest
 private with sharing class TestTPAWebServiceCrmIngCom
 {
    private static testMethod void coverTypes()
    {
       new TPAWebServiceCrmIngCom.abstractList();
    }
    private static testMethod void coverTypes1()
    {
       new TPAWebServiceCrmIngCom.Exception_x();
    }
    private static testMethod void coverTypes2()
    {
       new TPAWebServiceCrmIngCom.getTpaDetailsByPlan_element();
    }
    private static testMethod void coverTypes3()
    {
       new TPAWebServiceCrmIngCom.arrayList();
    }
    private static testMethod void coverTypes4()
    {
       new TPAWebServiceCrmIngCom.abstractCollection();
    }
    private static testMethod void coverTypes5()
    {
       new TPAWebServiceCrmIngCom.getTpaDetailsByTpaCode_element();
    }
  
    private class WebServiceMockImpl implements WebServiceMock
    {
        public void doInvoke(
            Object stub, Object request, Map<String, Object> response,
            String endpoint, String soapAction, String requestName,
            String responseNS, String responseName, String responseType)
        {
            if(request instanceof TPAWebServiceCrmIngCom.getTpaDetailsByTpaCode_element)
               response.put('response_x', new TPAWebServiceCrmIngCom.arrayList());
            return;
        }
    }
    @istest
   private static void coverMethods()
    {
        Test.setMock(WebServiceMock.class,new WebServiceMockImpl());
        new  TPAWebServiceCrmIngCom.TPALookUpPort().getTpaDetailsByTpaCode();
    }
    
    @istest
     private static void coverMethods1()
    {
        Test.setMock(WebServiceMock.class,new WebServiceMockImpl());
        new  TPAWebServiceCrmIngCom.TPALookUpPort().getTpaDetailsByPlan();
    }
 }