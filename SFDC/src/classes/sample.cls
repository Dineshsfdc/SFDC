public class sample{

    public String qry { get; set; }

   

    public PageReference searchfind() {
    pageReference pg = new pageReference('http://www.google.com/search?q='+qry);
        pg.setRedirect(true);
        return pg;
       
    }


}