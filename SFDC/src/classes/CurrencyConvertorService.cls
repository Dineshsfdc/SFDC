public class CurrencyConvertorService {
    public class CurrencyConvertorSoap {
        public String endpoint_x = 'http://www.webservicex.net/CurrencyConvertor.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://www.webserviceX.NET/', 'CurrencyConvertorService'};
        public Double ConversionRate(String FromCurrency,String ToCurrency) {
            CurrencyConvertorService.ConversionRate_element request_x = new CurrencyConvertorService.ConversionRate_element();
            CurrencyConvertorService.ConversionRateResponse_element response_x;
            request_x.FromCurrency = FromCurrency;
            request_x.ToCurrency = ToCurrency;
            Map<String, CurrencyConvertorService.ConversionRateResponse_element> response_map_x = new Map<String, CurrencyConvertorService.ConversionRateResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://www.webserviceX.NET/ConversionRate',
              'http://www.webserviceX.NET/',
              'ConversionRate',
              'http://www.webserviceX.NET/',
              'ConversionRateResponse',
              'CurrencyConvertorService.ConversionRateResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.ConversionRateResult;
        }
    }
    public class ConversionRate_element {
        public String FromCurrency;
        public String ToCurrency;
        private String[] FromCurrency_type_info = new String[]{'FromCurrency','http://www.webserviceX.NET/','Currency','1','1','false'};
        private String[] ToCurrency_type_info = new String[]{'ToCurrency','http://www.webserviceX.NET/','Currency','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.webserviceX.NET/','true','false'};
        private String[] field_order_type_info = new String[]{'FromCurrency','ToCurrency'};
    }
    public class ConversionRateResponse_element {
        public Double ConversionRateResult;
        private String[] ConversionRateResult_type_info = new String[]{'ConversionRateResult','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.webserviceX.NET/','true','false'};
        private String[] field_order_type_info = new String[]{'ConversionRateResult'};
    }
}