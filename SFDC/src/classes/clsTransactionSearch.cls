public with sharing class clsTransactionSearch {
    public string StartDate{get;set;}
    public string searchinput{get;set;}
    public static string strCheck{get;set;}
    public string SearchCountry{get;set;}
    public string EndDate{get;set;}
    public String[] grdData{get; set;}
    public string SearchText {get; set;}
    public Date chk{get; set;}
    public string onc {get; set;} 
    public boolean trantypePDF {get; set;} 
    public boolean trantypeFULL {get; set;}   
    string transactionPDF=''; 
    string transactionFULL ='';
    //public transaction__c announceDate{get;set;}
    public decimal amountMin {get;set;}
    public decimal amountMax {get;set;}
    public boolean tranStatusPending {get; set;} 
    public boolean tranStatusClosed {get; set;} 
    public boolean tranStatusCancelled {get; set;} 
    string transactionStatus='';
    public boolean excludeAmount {get; set;}
    Integer queryString;
    Integer queryLimit;
    Integer offset;
    public Boolean firstOff{set;get;}    // previous part
    public Boolean lastOff{set;get;}     // next part
    public String limits{set;get;}
    public Integer pageNumber{set;get;}
    public Integer listSize;    // for total contact size
  //paginationvariable declaration code end here
    //List<Transaction__c> lstQuery;
    public integer count{get; set;}
    //Transaction__c lstTransaction;
    //public List<Transaction_Relationship__c> lstTransactionRel;
    string tId='';
    public string strShow{get; set;}
    public string url = ApexPages.currentPage().getURL();
    //List<transaction__c> lstprofile = new List< transaction__c >();
    //List<StaticResource> documentList=[select name from StaticResource  where Name='pdfimage'];
    string ur='/resource/1373007575000/pdfimage';
   // string a= documentList[0].name;
    string finn='Financing';
    string maa='M&A';
    string emp=' ';
    string bank='Banking Tech';
    string pay='Payments Tech';
    string sec='Securities and Cap Mkts';
  //string ins='Insurance / Healthcare';
  //string hel='Insurance / Healthcare';
    string ins='Insurance Tech';
    string hel='Healthcare Tech';
    string fsbo='Financial BPO / IT Svcs';   
    string close='Closed';   
    string pen='Pending';
    string can='Cancelled';  
  //Constructor of Class.
    
    public clsTransactionSearch()
     {
      
     }     
//Used to bind the grid based on search criteria.
     public pagereference getData()
      {    
         //BindGridOnLoad();
           BindGrid();
           return null;
      }
      
    public void next()
    {
       
       offset += queryLimit;
       if(offset+queryLimit >= listSize) lastOff = false; 
       firstOff = true;
       pageNumber++;
       if(SearchText ==''|| SearchText=='null' )
       {
        BindGridOnLoad();
       }
       else if(SearchText !='')
       {
       BindGrid();
       
       }
    }
     //public List<Transaction__c> getRecords()
      //{
      //return (List<Transaction__c>)database.query(queryString+' LIMIT '+queryLimit+' OFFSET '+offset);
      //}
    
     /*  public void next()
       {
        offset += queryLimit;
        if(offset+queryLimit >= listSize) lastOff = false;
        firstOff = true;
        pageNumber++;
        
        
       }*/
    
    public void previous()
    {
        if(offset-queryLimit <= 0)
        {
        offset = 0;
        firstOff = false;
        }
        else offset -= queryLimit;
        lastOff = true;
        pageNumber--;
        if(SearchText ==''|| SearchText =='null' )
        {
        BindGridOnLoad();
        
        }
        else if(SearchText !='')
        {
        BindGrid();
        }
    }
    
 /*   public void previous()
    {
        if(offset-queryLimit <= 0)
        {
        offset = 0;
        firstOff = false;
        }
        else offset -= queryLimit;
        lastOff = true;
        pageNumber--;
        
        
    }*/
    
   public void first()
    {
        offset = 0;
        firstOff = false;
        lastOff = true;
        pageNumber = 1;
        if(SearchText ==''|| SearchText =='null' )
        {
        BindGridOnLoad();
       
        }
        else if(SearchText !='')
        {
        BindGrid();
        }
    }
    
     /* public void first()
     {
        offset = 0;
        firstOff = false;
        lastOff = true;
        pageNumber = 1;
        
        
     }*/
    
    public void last()
    {
        if(Math.Mod(listSize,queryLimit) == 0)
        {
        offset = listSize-queryLimit;
        pageNumber = listSize/queryLimit;
        system.debug('offset$______________$'+offset);
        system.debug('pageNumber $______________$'+pageNumber );
        if(SearchText ==''|| SearchText ==null )
        {
        BindGridOnLoad();
        
        }
        else if(SearchText !='')
        {
        BindGrid();
       
        }
        }
        else
        {
        offset = (listSize/queryLimit)*queryLimit;
        pageNumber = (listSize/queryLimit)+1;
        if(SearchText ==''|| SearchText ==null )
        {
        BindGridOnLoad();
        
        }
        else if(SearchText !='')
        {
        BindGrid();
        
        }
        
        }
        lastOff = false;
        firstOff = true;
    }
    
  /*  public void last(){
        // set page number of and offset
        if(Math.Mod(listSize,queryLimit) == 0)
        {
            offset = listSize-queryLimit;
            pageNumber = listSize/queryLimit;
            
            
        }
        else
        {
            offset = (listSize/queryLimit)*queryLimit;
            pageNumber = (listSize/queryLimit)+1;
            
        }
        
        lastOff = false;
        firstOff = true;
    }*/
    
  /* public List<SelectOption> getItems()
    {
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('20','20'));
        options.add(new SelectOption('50','50'));
        options.add(new SelectOption('100','100'));
        return options;
    }*/
    // change query limit
    public void changeLimit()
    {
      //set query limit
        queryLimit = Integer.valueOf(limits);
        offset = 0;
        firstOff = false;
      //initialy check page more then 1 or not
        if(listSize > queryLimit) lastOff = true;
        else lastOff = false;
      //set page number
        pageNumber = 1;
    }
    
    // for show current record numbers
   
     
     
     public String getRecordInfo()
    {
        integer lastLimit;
        if(offset+queryLimit > listSize) 
        {
            lastLimit = listSize;
        }
        else if(offset+queryLimit <= listSize) 
        { 
        lastLimit = offset+queryLimit;
        }
        if(listSize >75)
        {
         return (offset+1) + ' - ' + lastLimit + ' of '+listSize;
        }
        else if(listSize<=75)
        {
          return  'Records Found :' +listSize;
        }
        return null;
    }
    /*     public String getRecordInfo()
     {
        integer lastLimit;
        if(offset+queryLimit > listSize) lastLimit = listSize;
        else lastLimit = offset+queryLimit;
        return (offset+1) + ' - ' + lastLimit + ' of '+listSize;
     }*/
   
    
    // return total page number
    public Integer getTotalPage()
    {
        try
        {        
        if(Math.Mod(listSize,queryLimit) == 0) 
        return listSize/queryLimit;
        else 
        return (listSize/queryLimit)+1;
        }
        catch(Exception ex)
        {
         integer ss = 0;
         ApexPages.addMessages(ex);  
         system.debug('Get Total page catch$______________$'+ ex);   
         return  ss;      
        }
    }
   /*  public Integer getTotalPage()
     {
     if(Math.Mod(listSize,queryLimit) == 0) return listSize/queryLimit;
     else return (listSize/queryLimit)+1;
     } */
    
    // for direct page switching
     public void pageNavigation()
    {
    
        if(Math.Mod(listSize,queryLimit) == 0 && pageNumber > listSize/queryLimit)
        pageNumber = listSize/queryLimit; 
        else if(pageNumber > (listSize/queryLimit)+1)
        pageNumber = (listSize/queryLimit)+1;
    
     // set offset according to pageNumber    
        if((pageNumber-1)*queryLimit < 0) offset = 0;
        else offset = (pageNumber-1)*queryLimit;    
        
        
        if(pageNumber == 1) firstOff = false;
        else if(pageNumber == 0) pageNumber = 1;
        else if(pageNumber > 1) firstOff = true;
    
     // user enter last number of pagenumber than deactive next navigator
        if(Math.Mod(listSize,queryLimit) == 0){
        if(pageNumber == listSize/queryLimit) lastOff = false;
        else lastOff = true;
        }
        else{
        if(pageNumber == (listSize/queryLimit)+1) lastOff = false;
        else lastOff = true;
        }
    }
    
    //pagination code end   
   
//Used to bind the grid based on search criteria.
    public void BindGrid()
    {  
         
   }
   
   // BindGrid() fun end here
   public void BindGridOnLoad()
      {
       
      }   
      
     
    
      
      //Method for the company and Buyer Investor search from the detail page.
      public void companyBuyerInv()
      {  
        
}
}