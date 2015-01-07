public class ajaxcontrol 
 {
  public string currtime;
  public string getcurrtime()
  {
   return currtime;
  }
  public string setcurrtime()
  {
   currTime = System.now().format('EEEE, MMMM d, yyyy - hh:mm:ss');
   return null;
  }
 }