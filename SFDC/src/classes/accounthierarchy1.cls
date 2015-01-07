public class accounthierarchy1{ 


 public List<hierarchyItem> hierarchyItemList {get;set;} 

 private Map<Id , account> mapHierarchy = new Map<Id ,account>(); 
 private Map<Id , account> mapHierarchy1 = new Map<Id ,account>(); 

 private static Integer hirarchyIndex = 0; 

 public String AccountName {get;set;} 

 

 public accounthierarchy1(ApexPages.StandardController controller) {

 
 system.debug('*************controller');
 mapHierarchy = new Map<Id , account>([Select Name,ReportsTo__c From account where ReportsTo__c =: null]);  
 mapHierarchy1 = new Map<Id , account>([Select Name,ReportsTo__c From account where ReportsTo__c != null]);
 
 hierarchyItemList = new List<hierarchyItem>(); 

 for(account h : mapHierarchy.values()) 

 { 
  system.debug('*************loop1');

 if(h.ReportsTo__c == null) 

 { 
 system.debug('*************true');
 hierarchyItemList.add(new hierarchyItem( h.Name,h.ReportsTo__c , 0)); 
 system.debug('*************after call next loop');

 mapHierarchy.remove(h.id); 

 hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList); 

 } 

 } 

 } 

 

 private List<hierarchyItem> getChildHierarchy(Id parentId , List<hierarchyItem> currentHierarchyItemList) 

 { 

 hirarchyIndex = hirarchyIndex + 1; 

 for(account h : mapHierarchy1.values()) 

 { 
 
 system.debug('*************call final loop');

 if(h.ReportsTo__c == parentId) 

 { 

 hierarchyItemList.add(new hierarchyItem( h.Name,h.ReportsTo__c,hirarchyIndex)); 

 mapHierarchy1.remove(h.id); 

 hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList); 

 } 

 

 } 

 hirarchyIndex = hirarchyIndex - 1; 

 return currentHierarchyItemList; 

 } 

 

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

  system.debug('*************call next loop');
 spaceCount = spaceCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; 

 }

 this.itemValue = spaceCount + itemValue;

 } 

 } 

}