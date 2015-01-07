trigger Trigger2 on Contact (before update)   
    {  
          contact cold = trigger.old[0];
          contact cnew = trigger.new[0];
          if(cold.SLA_date__c !=cnew.SLA_date__c)
          {
           cnew.adderror('error');
          }
          
       /** for(Contact con  : Trigger.New)  
            {     
                //Trigger Action Logic  
                List<Account> accList = [Select Phone from Account where id =: con.AccountId];        
                for(Account acc : accList)  
                    {  
                        acc.Phone = con.Phone;  
                    }  
                update accList;      
             
            }  **/
    }