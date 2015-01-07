public class downloadpdfcontroller 
{
 public string artid{get;set;}
 public list<Procedure__kav> pro{get;set;}
 public string mode{get;set;}

 public downloadpdfcontroller()
 {
  artid=Apexpages.currentpage().getparameters().get('id');
  mode=Apexpages.currentpage().getparameters().get('mode');
  
  pro = new list<procedure__kav>();
  system.debug('*********mode********'+mode);
   if(mode=='all')
   {
    pro = [select id,ArticleNumber,Title,UrlName,ArticleType,Language,PublishStatus,steps__c from Procedure__kav where PublishStatus='online' AND language ='en_US'];
   }
   else
   if(mode == 'one')
   {
   pro = [select id,ArticleNumber,Title,UrlName,ArticleType,Language,PublishStatus,steps__c from Procedure__kav where id=:artid and PublishStatus='online' AND language ='en_US'];
   }
   //return pro;
 }
 
}