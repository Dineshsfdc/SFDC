public class hierarchy1{ 
    
  
    //List of items to be displayed in hierarchy  
    public List<hierarchyItem> hierarchyItemList {get;set;}  
      
    //map of all  hierarchy records related to for a account for which we are showing hierarchy  
    private Map<Id , Hierarchy__c> mapHierarchy = new Map<Id , Hierarchy__c>();  
      
    //Hierarchy Index, used to determine spaces before the name starts  
    private static Integer hirarchyIndex = 0;  
      
    //name of account for which hierarchy is created  
    public String AccountName {get;set;}  
      
    public hierarchy1(ApexPages.StandardController controller) {
   
       //if(ApexPages.currentPage().getParameters().get('id') != null)  
       // {  
       //     ID AccountID = ApexPages.currentPage().getParameters().get('id');  
             
         //   AccountName = [Select Name From Account where id =: AccountID].Name;  
            //Get all hierarchy records related to account  
            mapHierarchy = new Map<Id , Hierarchy__c>([Select Name,Link__c,accountname__c,accountid__c,Parent_Hierarchy__c  From Hierarchy__c]); // Where AccountId__c =: AccountID]);  
              
             
              
          
            hierarchyItemList = new List<hierarchyItem>();  
              
            for(Hierarchy__c h : mapHierarchy.values())  
                {  
                    if(h.Parent_Hierarchy__c  == null)  
                    {  
                        hierarchyItemList.add(new hierarchyItem( h.Name,h.Link__c,h.accountname__c,h.accountid__c , 0));  
                        mapHierarchy.remove(h.id);  
                        hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList);  
                    }  
                      
                }  
       // }  
    }  
  
    //Method to get child records  
    private List<hierarchyItem> getChildHierarchy(Id parentId , List<hierarchyItem> currentHierarchyItemList)  
    {  
        hirarchyIndex = hirarchyIndex + 1;  
        for(Hierarchy__c h : mapHierarchy.values())  
            {  
                if(h.Parent_Hierarchy__c == parentId)  
                    {  
                        hierarchyItemList.add(new hierarchyItem( h.Name,h.link__c,h.accountname__c,h.accountid__c, hirarchyIndex));  
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
        public String acname{get;set;} 
        public string ids{get;set;}  
        public string spacecnt{get;set;}  
        public string link{get;set;}  
        public String hirarchyIndexNo{get;set;}  
        public map<string,string> disp{get;set;}
        public hierarchyItem(String itemValue ,string link,string name,string ids, Integer hirarchyIndexNo)  
            {  
                String spaceCount = ' ';  
                for(integer i = 0 ; i < hirarchyIndexNo ; i++) 
                { 
                    spaceCount = spaceCount  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';  
                 }
                    //  id i = Id.valueof(ids);
        
                this.itemValue = spaceCount + itemValue +' '+ link;
               // this.ids = i;
               // this.acname = name;
               // this.spacecnt = spacecount;
           
            }  
    }  
  
}