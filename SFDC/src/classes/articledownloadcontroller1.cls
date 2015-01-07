public class articledownloadcontroller1 
{
 public list<KnowledgeArticleVersion> art;
 public string artid{get;set;}
 public articledownloadcontroller1()
 {
 
 }

 public list<KnowledgeArticleVersion> getArt() 
 {
      art=[SELECT id,Title ,UrlName, KnowledgeArticleId, PublishStatus, language FROM KnowledgeArticleVersion WHERE PublishStatus='Online' and language ='en_US' AND KnowledgeArticleId  IN (SELECT ParentId FROM KnowledgeArticleViewStat)];       
      return art;
        
 }
 
 public pagereference download()
 {
  
  this.artid= System.currentPageReference().getParameters().get('artid');
  system.debug('*********articleid'+artid);
  Pagereference ref = new pagereference('/apex/downloadpdf?id='+artid+'&mode=one');
  ref.setredirect(true);
  return ref;
 }
 public pagereference downloadall()
 {
  Pagereference ref = new pagereference('/apex/downloadpdf?mode=all');
  ref.setredirect(true);
  return ref;
 }

}