public with sharing class orgchartusingvisualController {


    transient List<OrgChart.accWithrepto> accWithreptoList;
    public String accId{get; set;}
    private Set<ID> selectedaccIds = new Set<ID>();
    
      public orgchartusingvisualController(ApexPages.StandardController controller) {
     init();
    }
   
   
    private void init() {  
        selectedaccIds = OrgChart.gettopaccountIds();
    }
   
    private void clearaccList() {
        accWithreptoList = null;
    }
    
    public List<OrgChart.accWithrepto> getaccwithreptoList() {
        if (accwithreptoList == null) {
            accwithreptoList = OrgChart.getaccwithrepto(selectedaccIds);       
        }
        return accWithreptoList;                      
    }
    
    public PageReference loadMore() {
        if (accId != null) {
            selectedaccIds.add(accid);
            clearaccList();
        }
        return null;
    }
    
    public PageReference expandAll() {
        selectedaccIds = OrgChart.getAllaccIds();
        clearaccList();
        
        return Page.OrgChartusingvisual;
    }
    
    public PageReference collapseAll() {
        clearaccList();
        init();
        return Page.OrgChartusingvisual;
    }
    

}