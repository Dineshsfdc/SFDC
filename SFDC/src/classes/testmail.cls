@isTest
public class testmail
 {
 public static testmethod void m1()
 {

  controlmail m = new controlmail();
 
  m.to = 'friends.dinesh28@gmail.com';
  m.cc = 'dineshkumar1228@gmail.com';
  m.sub = 'hi';
  m.body = 'hai';
  m.send();
}

public static testmethod void m2()
 {

  controlmail m = new controlmail();
 
  m.to = 'friends.dinesh28@gmail.com';
  m.sub = 'hi';
  m.body = 'hai';
  m.send();
}
}