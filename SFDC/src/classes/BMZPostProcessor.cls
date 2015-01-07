global class BMZPostProcessor {
  
    public static final Integer PROCESS_BMZ_CAMPAIGNS       = 1;

    public static final Integer PROCESS_BMZ_CAMPAIGNMEMBERS = 2;
    
   // Process Campaign Data
   
    webservice static String processCampaignData() {
        String query = 'Select b.name From Campaign b';
                     
        if(Test.isRunningTest())
              query += ' limit 10';

        return null;
        return Database.executeBatch(new BMZPostProcessorBatchable(query, PROCESS_BMZ_CAMPAIGNS));
    }
    
   // Process CampaignMembers Data
    webservice static String processEmailCampaignData() {

        String query = 'Select b.firstname From CampaignMember b' ;
            
        if(Test.isRunningTest())

              query += ' limit 10';
        
          return null;
        return Database.executeBatch(new BMZPostProcessorBatchable(query, PROCESS_BMZ_CAMPAIGNMEMBERS), 100);
    }

}