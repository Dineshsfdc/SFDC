//Generated by wsdl2apex

public class soapSforceComSchemasClassHelloworld {
    public class sayHelloResponse_element {
        public String result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class DebuggingHeader_element {
        public soapSforceComSchemasClassHelloworld.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class sayHello_element {
        public String h;
        private String[] h_type_info = new String[]{'h','http://soap.sforce.com/schemas/class/HelloWorldWebService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService','true','false'};
        private String[] field_order_type_info = new String[]{'h'};
    }
    public class HelloWorldWebService {
        public String endpoint_x = 'https://na15.salesforce.com/services/Soap/class/HelloWorldWebService';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassHelloworld.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassHelloworld.DebuggingHeader_element DebuggingHeader;
        public soapSforceComSchemasClassHelloworld.CallOptions_element CallOptions;
        public soapSforceComSchemasClassHelloworld.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassHelloworld.SessionHeader_element SessionHeader;
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/HelloWorldWebService';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/HelloWorldWebService';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/HelloWorldWebService';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/HelloWorldWebService';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/HelloWorldWebService';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldWebService', 'soapSforceComSchemasClassHelloworld'};
        public String sayHello(String h) {
            soapSforceComSchemasClassHelloworld.sayHello_element request_x = new soapSforceComSchemasClassHelloworld.sayHello_element();
            request_x.h = h;
            soapSforceComSchemasClassHelloworld.sayHelloResponse_element response_x;
            Map<String, soapSforceComSchemasClassHelloworld.sayHelloResponse_element> response_map_x = new Map<String, soapSforceComSchemasClassHelloworld.sayHelloResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HelloWorldWebService',
              'sayHello',
              'http://soap.sforce.com/schemas/class/HelloWorldWebService',
              'sayHelloResponse',
              'soapSforceComSchemasClassHelloworld.sayHelloResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}