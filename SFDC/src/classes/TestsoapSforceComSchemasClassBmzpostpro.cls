@IsTest
private with sharing class TestsoapSforceComSchemasClassBmzpostpro
{
    private static testMethod void coverTypes()
    {
       new soapSforceComSchemasClassBmzpostpro.Loginfo();
    }
    private static testMethod void coverTypes1()
    {
       new soapSforceComSchemasClassBmzpostpro.AllowFieldTruncationHeader_element();
    }
    private static testMethod void coverTypes2()
    {
       new soapSforceComSchemasClassBmzpostpro.DebuggingHeader_element();
    }
    private static testMethod void coverTypes3()
    {
       new soapSforceComSchemasClassBmzpostpro.CallOptions_element();
    }
    private static testMethod void coverTypes4()
    {
       new soapSforceComSchemasClassBmzpostpro.processEmailCampaignDataResponse_element();
    }
    private static testMethod void coverTypes5()
    {
       new soapSforceComSchemasClassBmzpostpro.processEmailCampaignData_element();
    }
    private static testMethod void coverTypes6()
    {
       new soapSforceComSchemasClassBmzpostpro.processCampaignDataResponse_element();
    }
    private static testMethod void coverType7()
    {
       new soapSforceComSchemasClassBmzpostpro.processCampaignData_element();
    }
    private static testMethod void coverTypes8()
    {
       new soapSforceComSchemasClassBmzpostpro.SessionHeader_element();
    }
    private static testMethod void coverTypes9()
    {
       new soapSforceComSchemasClassBmzpostpro.DebuggingInfo_element();
    }
    private static testMethod void testm1()
   {
     soapSforceComSchemasClassBmzpostpro obj = new soapSforceComSchemasClassBmzpostpro();
     string obj1 = new soapSforceComSchemasClassBmzpostpro.BMZPostProcessor().processEmailCampaignData();
   }
   private static testMethod void testm2()
   {
     soapSforceComSchemasClassBmzpostpro obj = new soapSforceComSchemasClassBmzpostpro();
     string obj2 = new soapSforceComSchemasClassBmzpostpro.BMZPostProcessor().processCampaignData();
   }  
}