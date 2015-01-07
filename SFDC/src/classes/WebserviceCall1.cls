public with sharing class WebserviceCall1 {

    public string celsius { get; set; }
    public string faran { get; set; }
 
    public string celtofaranresult {get; private set;}
    public string farantocelresult {get; private set;}

  public PageReference celsius() {    
    wwwW3schoolsComWebservices.TempConvertSoap  stub = new wwwW3schoolsComWebservices.TempConvertSoap();
      farantocelresult= stub.FahrenheitToCelsius(faran);
       return null;
    }
    public PageReference faran() {    
    wwwW3schoolsComWebservices.TempConvertSoap  stub = new wwwW3schoolsComWebservices.TempConvertSoap();
      celtofaranresult= stub.CelsiusToFahrenheit(celsius);
       return null;
    }

}