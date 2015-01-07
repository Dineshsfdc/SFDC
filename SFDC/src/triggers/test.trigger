trigger test on Account (after update) 
{
 // List<procedure__ka> f = new List<procedure__ka>();
 // f=[Select id From procedure__ka WHERE id ='kA0i0000000CU8u']; //and PublishStatus = \'online\' and IsVisibleInPkb = true];  
 
 
  List<KnowledgeArticleVersion > f = new List<KnowledgeArticleVersion >();
  f=[SELECT id,Title , UrlName, KnowledgeArticleId, PublishStatus, language FROM KnowledgeArticleVersion WHERE PublishStatus='Online' and language ='en_US' AND KnowledgeArticleId  IN (SELECT ParentId FROM KnowledgeArticleViewStat)];
             
  System.debug('*******************dinesh'+f);

}