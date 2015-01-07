@RestResource(urlmapping='/Account/*')   

//@RestResource annotation is used at the class level and enables you to expose an Apex class as a REST resource.
//class responsible for handling HTTP requests and act as REST based web service

//urlMapping  property allows us to set path where the service will be available.

 global class restcontroller
 {
 @Httpget    //denoting a method to respond on a HTTP GET request;
 global static decimal convert() 
 {
  RestRequest req = System.RestContext.request;
  RestResponse resp = System.RestContext.response;
  decimal val = decimal.valueof(req.params.get('v1'));
  decimal res;
  string op = req.params.get('op');
  if(op == 'ctof')
  {
   res = (1.8*val)+32;
  }
  else
  if(op == 'ftoc')
  {
   res = 0.555555*(val-32);
  }
  return res;
 }
 }