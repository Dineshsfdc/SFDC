public class checksobjectprofiles 
{

    public List<SelectOption> ListOfUser {public get; private set; }

    public String selecteduserId { get; set; }

     public string searchresult;
      public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
      public List <SelectOption> objectNames{public get; private set;}
      public String selectedObject {get; set;}
      
      
 public checksobjectprofiles () 
    {
        objectNames = initObjNames();
         ListOfUser= initListOfUser();
       
        
    }
  private List<SelectOption> initObjNames() 
  {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        objNames.add(new SelectOption( ' ' ,'---Select---'));
        for(String name : entities)
        {
        
        
        objNames.add(new SelectOption(name,name));
        }
        return objNames;
   }
        
  private List<SelectOption> initListOfUser()
    {            
              // String uid = UserInfo.getUserId();
               List<User> thisUser = [select id, Username, profile.name from User where IsActive=true];
               List<SelectOption> Ulist = new List<SelectOption>();
               Ulist.add(new SelectOption( ' ' ,'---Select---'));
               for(User u : thisuser )
               {
                       
                          Ulist.add(new SelectOption(u.Username ,u.username));
               }
              return Ulist ;
    }
        
 public void checkFields() 
  { 
        
        //fields.clear();
        system.debug('$$$$$' + selectedObject);
        list<string> sobjectfields = new list<string>();
        Map <String, Schema.SObjectField> fieldMap = schemaMap.get(selectedObject).getDescribe().fields.getMap();
        for(Schema.SObjectField sfield : fieldMap.Values())
        {
            schema.describefieldresult fieldresult = sfield.getDescribe();
            system.debug('#######'  + fieldresult );   
        }
        
          //  system.debug('@@@@@@@@@@@@@@@@@@@'+selectedObject);
            
            Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();  
            Schema.DescribeSObjectResult r = gd.get(selectedObject).getDescribe();  
            String tempName = r.getName(); 
            system.debug('*************'+tempname);
            system.debug('selecteduserid'+selecteduserId);
          //  system.debug('feild'+fieldresult);
            
           // String query= 'select'+ 'feildresult' +'from' +'tempName' ;
           // system.debug('*************'+query);
        
    }
 
 
 
}