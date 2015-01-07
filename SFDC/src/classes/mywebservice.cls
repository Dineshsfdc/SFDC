Global class mywebservice
{
 webservice static id newaccount(string aname)
 {
  Account a = new account();
  a.name = aname;
  insert a;
  return a.id;
 }
}