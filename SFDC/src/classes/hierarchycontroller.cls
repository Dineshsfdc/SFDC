public class hierarchycontroller
{
 //List of items to be displayed in hierarchy  
    public List<hierarchyItem> hierarchyItemList {get;set;}   // hierarchyitem - inner class name
      
    //map of all  hierarchy records related to for a account for which we are showing hierarchy  
    private Map<Id , account> mapHierarchy = new Map<Id , account>();  
      
    //Hierarchy Index, used to determine spaces before the name starts  
    private static Integer hirarchyIndex = 0;  
      
    //name of account for which hierarchy is created  
    public String AccountName {get;set;}  
      
    public hierarchycontroller()  
    {  
        if(ApexPages.currentPage().getParameters().get('accountid') != null)  
        {  
            ID AccountID = ApexPages.currentPage().getParameters().get('accountid');  
             
            AccountName = [Select Name From Account where id =: AccountID].Name;  
            //Get all hierarchy records related to account  
            mapHierarchy = new Map<Id , account>([Select id,Name ,ReportsTo__c From account Where ReportsTo__c =: AccountID]);  
            
            system.debug('*********maphierarchy'+maphierarchy);
              
             
            hierarchyItemList = new List<hierarchyItem>();  
              
            for(account h : mapHierarchy.values())  
                {  
                    if(h.ReportsTo__c  == null)  
                    {  
                        hierarchyItemList.add(new hierarchyItem( h.Name , 0));  
                        mapHierarchy.remove(h.id);  
                        hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList);  
                    }  
                      
                }  
        }  
    }  
  
    //Method to get child records  
    private List<hierarchyItem> getChildHierarchy(Id parentId , List<hierarchyItem> currentHierarchyItemList)  
    {  
        hirarchyIndex = hirarchyIndex + 1;  
        for(account h : mapHierarchy.values())  
            {  
                if(h.ReportsTo__c == parentId)  
                    {  
                        hierarchyItemList.add(new hierarchyItem( h.Name , hirarchyIndex));  
                        mapHierarchy.remove(h.id);  
                        //Get child records of child  
                        hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList);  
                    }  
                  
            }  
        hirarchyIndex = hirarchyIndex - 1;      
        return currentHierarchyItemList;      
    }      
      
    //Inner class for maintaing hierarchy items  
    public class hierarchyItem{  
          
        public String itemValue{get;set;}   
        public String hirarchyIndexNo{get;set;}  
        public hierarchyItem(String itemValue , Integer hirarchyIndexNo)  
            {  
                String spaceCount = '';  
                for(integer i = 0 ; i < hirarchyIndexNo ; i++)  
                    spaceCount = spaceCount  + '&nbsp;&nbsp;';  
                      
                this.itemValue = spaceCount + itemValue;  
            }  
    }  
}