public class printactivities {

public list<contact> acct{get;set;}
public string id;
    public printactivities(ApexPages.StandardController controller) 
    {
      id = Apexpages.currentpage().getparameters().get('id');
      acct = new list<contact>();
      acct = [SELECT id,name,(SELECT id,IsTask,LastModifiedDate,ownerid,Whoid,Whatid,subject,Activitytype,ActivityDate, Description FROM ActivityHistories) FROM contact WHERE id=:id];
      system.debug('************acct'+acct);
    }

}