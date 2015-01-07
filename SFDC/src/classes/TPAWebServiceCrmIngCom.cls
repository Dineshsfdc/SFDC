public class TPAWebServiceCrmIngCom {
    public class abstractList {

        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};
        private String[] field_order_type_info = new String[]{};

    }
    public class Exception_x {
        public String message;
        private String[] message_type_info = new String[]{'message','http://service.crm.ing.com/',null,'0','1','false'};

        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};
        private String[] field_order_type_info = new String[]{'message'};

    }
    public class getTpaDetailsByPlan_element {
        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};

        private String[] field_order_type_info = new String[]{};
    }
    public class arrayList {
        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};

        private String[] field_order_type_info = new String[]{};
    }
    public class abstractCollection {
        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};

        private String[] field_order_type_info = new String[]{};
    }
    public class getTpaDetailsByTpaCode_element {
        private String[] apex_schema_type_info = new String[]{'http://service.crm.ing.com/','false','false'};

        private String[] field_order_type_info = new String[]{};
    }
    public class TPALookUpPort {
        public String endpoint_x = 'http://esalesforceservices.intg.apptoapp.net:80/esalesforceservices/TPALookUpService';

        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;

        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://service.crm.ing.com/', 'TPAWebServiceCrmIngCom'};
        public void getTpaDetailsByTpaCode() {

            TPAWebServiceCrmIngCom.getTpaDetailsByTpaCode_element request_x = new TPAWebServiceCrmIngCom.getTpaDetailsByTpaCode_element();
            TPAWebServiceCrmIngCom.arrayList response_x;
            Map<String, TPAWebServiceCrmIngCom.arrayList> response_map_x = new Map<String, TPAWebServiceCrmIngCom.arrayList>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,

              '',
              'http://service.crm.ing.com/',
              'getTpaDetailsByTpaCode',
              'http://service.crm.ing.com/',

              'getTpaDetailsByTpaCodeResponse',
              'TPAWebServiceCrmIngCom.arrayList'}
            );
            response_x = response_map_x.get('response_x');
        }

        public void getTpaDetailsByPlan() {
            TPAWebServiceCrmIngCom.getTpaDetailsByPlan_element request_x = new TPAWebServiceCrmIngCom.getTpaDetailsByPlan_element();
            TPAWebServiceCrmIngCom.arrayList response_x;

            Map<String, TPAWebServiceCrmIngCom.arrayList> response_map_x = new Map<String, TPAWebServiceCrmIngCom.arrayList>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(

              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://service.crm.ing.com/',

              'getTpaDetailsByPlan',
              'http://service.crm.ing.com/',
              'getTpaDetailsByPlanResponse',
              'TPAWebServiceCrmIngCom.arrayList'}

            );
           response_x = response_map_x.get('response_x');
        }
    }
}