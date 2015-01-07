public class actionSupportController {
    Integer count = 0;
 
    public PageReference incrementCounter() {
            count++;
            return null;
    }
 
    public PageReference decrementCounter() {
            count--;
            return null;
    }
    public PageReference view() {
               count =0;
           return null;
    }
 
    public Integer getCount() {
        return count;
    }
}