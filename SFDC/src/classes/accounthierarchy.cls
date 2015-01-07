public class accounthierarchy{ 
   
    public List<hierarchyItem> hierarchyItemList {get;set;}  
     public List<hierarchyItem> hierarchyItemList1 {get;set;}
    private Map<Id , account> mapHierarchy = new Map<Id ,account>();  
    private static Integer hirarchyIndex = 0;  
    public String AccountName {get;set;}  
      
    public accounthierarchy(ApexPages.StandardController controller) {
   
            mapHierarchy = new Map<Id , account>([Select Name,ReportsTo__c From account]); 
            hierarchyItemList = new List<hierarchyItem>(); 
            hierarchyItemList1 = new List<hierarchyItem>();     
            for(account h : mapHierarchy.values())  
                {  
                    if(h.ReportsTo__c  == null)  
                    {  
                        hierarchyItemList.add(new hierarchyItem( h.Name,h.ReportsTo__c , 0));  
                        mapHierarchy.remove(h.id);  
                      //  hierarchyItemList1 = getChildHierarchy(h.id , hierarchyItemList);  
                    }  
                      
                }   
            }  
  
   // private List<hierarchyItem> getChildHierarchy(Id parentId , List<hierarchyItem> currentHierarchyItemList)  
  //  {  
  //      hirarchyIndex = hirarchyIndex + 1;  
   //     for(account h : mapHierarchy.values())  
    //        {  
     //           if(h.ReportsTo__c == parentId)  
      //              {  
      //                  hierarchyItemList.add(new hierarchyItem( h.Name,h.ReportsTo__c, hirarchyIndex));  
      //                  mapHierarchy.remove(h.id);  
      //                  hierarchyItemList1 = getChildHierarchy(h.id , hierarchyItemList);  
      //              }  
                  
      //      }  
      //  hirarchyIndex = hirarchyIndex - 1;      
      //  return currentHierarchyItemList;      
   // }      
    
    public class hierarchyItem{  
          
        public String itemValue{get;set;} 
        public string spacecnt{get;set;}  
        public String hirarchyIndexNo{get;set;}  
        public map<string,string> disp{get;set;}
        public hierarchyItem(String itemValue ,string name, Integer hirarchyIndexNo)  
            {  
                String spaceCount = ' ';  
                for(integer i = 0 ; i < hirarchyIndexNo ; i++) 
                { 
                    spaceCount = spaceCount  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';  
                }
                        this.itemValue = spaceCount + itemValue;
          }  
    }  
  
}