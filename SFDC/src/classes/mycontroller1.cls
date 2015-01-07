public class mycontroller1
{
public integer value1{get;set;}
public integer value2{get;set;}
public integer value3{get;set;}

public mycontroller1()//not needed
{
}
   public PageReference add() 
    {
       value3 = value1 + value2;
       return null;
    }
}