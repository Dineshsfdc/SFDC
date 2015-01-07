@isTest
public class WebSvcCalloutTest {
   Public static void testgetTpaDetailsByTpaCode() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new WebServiceMockImpl());

        // Call the method that invokes a callout
         WebSvcCallout.callgetTpaDetailsByTpaCode();

        // Verify that a fake result is returned
       // System.assertEquals('Mock response', output);
    }
}