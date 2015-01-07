public with sharing class WebserviceCall {

    public String currencyTo { get; set; }

   public String currencyFrom { get; set; }
 public Double message {get; private set;}

  public PageReference hello() {    
    CurrencyConvertorService.CurrencyConvertorSoap  stub = new CurrencyConvertorService.CurrencyConvertorSoap();
    message = stub.ConversionRate(currencyFrom ,currencyTo );
        return null;
    }

}