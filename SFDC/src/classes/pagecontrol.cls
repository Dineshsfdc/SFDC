public with sharing class pagecontrol {

public String iframeSource { get; set; }
    public pagecontrol(ApexPages.StandardController controller) {
    

    }
    public PageReference reloadIframe() {
        iframeSource = '//www.youtube.com/embed/nkLUOhYw41A';
        return null;
    }

}