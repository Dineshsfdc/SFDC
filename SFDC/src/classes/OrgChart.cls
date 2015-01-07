public with sharing class OrgChart {
    
    static Boolean chatterEnabled = true;
    public static List<accwithrepto> getaccWithrepto(Set<ID> accIds) {
        List<accwithrepto> accwithreptoList = new List<accwithrepto>();
        List<account> acct = new List<account>();
        
        acct = [SELECT ID,Name,ReportsTo__c  FROM account WHERE ReportsTo__c IN :accIds OR ID IN :accIds ORDER BY ReportsTo__c NULLS FIRST, ID];
        
        accWithreptoList = new List<accWithrepto>();
        for (account ur : acct) 
        {
            accWithreptoList.add(new accWithrepto(ur, (accIds.contains(ur.id))));
        }
        
        return accWithreptoList;
    }
    
    public static Set<ID> getTopaccountIds() {   
        Set<Id> accIds = new Set<Id>();
        List<account> topaccount = [SELECT ID FROM account WHERE ReportsTo__c = null];
        for (Account ur : topaccount) {
            accIds.add(ur.ID);
        }
        return accIds;
    }
    
    public static Set<ID> getAllaccIds() {    
        Set<Id> accIds = new Set<ID>();
        List<account> topacct = [SELECT ID FROM account LIMIT 500];
        for (account ur : topacct) {
            accIds.add(ur.ID);
        }
        return accIds;
    }
   
    public class accWithrepto {
        public account acc {get; set;}
        public Boolean isExpanded {get; set;}
        
        public accwithrepto(account al, Boolean expanded) {
            this.acc = al;
            this.isExpanded = expanded;
        }
        
        public String getId() {
            return acc.id;
        }
        
        public String getParent() {
            return acc.ReportsTo__c;
        }
        
        public String getTitle() {
            return acc.name;
        }
        
        public String getaccBody() {
            if (acc != null){
                String accBody = '<div class="chartCell"> <div class="cellTitle">' +
                                    '<a href="javascript://nop/" onclick="loadMore(\''+acc.id+'\');">';
                                    
                if (!isExpanded)
                    accBody += '<img class="expandIcon" src="/s.gif" style="float:left;"/>';
                
                accBody += acc.name + '</a></div><div style="clear:both;"></div>';   
                accBody += '</div>';
                return accBody;            
            }
            return '';
            
        }

    } 
}