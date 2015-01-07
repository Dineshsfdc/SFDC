@isTest
public  class testChecknote
{
 public static testmethod void m1()
 {
    Contact c = new Contact(firstname='c1',lastname='l1');
    insert c;
   
    Note nte=new Note(body='Test note',parentId=c.id,title='testnotes');
    insert nte;
              
    Note delnote= [select id from Note where id=:nte.id];
    delete delnote;                    
 }
}