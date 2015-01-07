@isTest
public class testajaxcontrol
{
public static testmethod void m1()
{
ajaxcontrol a = new ajaxcontrol();
a.currTime = System.now().format('EEEE, MMMM d, yyyy - hh:mm:ss');
a.getcurrtime();
a.setcurrtime();
}
}