public with sharing class pagecontroller {

    public String iframeSource { get; set; }
    
    public pagecontroller()
    {
    
    iframeSource = 'https://developer.salesforce.com/forums/ForumsMain?id=906F0000000966AIAQ';
    }

    public PageReference reloadIframe() {
    iframeSource = 'https://sandbox.webcomcpq.com/Catalogue/CategoryTree.aspx';
        return null;
    }

}