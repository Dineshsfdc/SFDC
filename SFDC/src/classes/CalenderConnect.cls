public class CalenderConnect {
    public Boolean calenderShow { get; set; }
    public String emailValue { get; set; }

    public PageReference displayCalender() {
        calenderShow =true;
        return null;
    }
    public PageReference outlookConnect() {
        System.debug(emailValue);
        if(emailValue ==''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Email Address Should be specified')); }
        try{
        String vCal = 'BEGIN:VCALENDAR'+ '\n'
                            +'VERSION:1.0' + '\n'
                            +'BEGIN:VEVENT' + '\n'
                            +'URL:Site Url'+ '\n'
                            +'DTSTART:20140329T223000Z'+ '\n'
                            +'DTEND:20140330T023000Z'+ '\n'
                            +'SUMMARY:Message'+ '\n'
                            +'DESCRIPTION:Body Message'+ '\n'
                         +'LOCATION:Class of 1923 Ice Rink - 3130 Walnut St - Philadelphia, PA 19104'+'\n'
                            +'END:VEVENT'+ '\n'
                            +'END:VCALENDAR'+ '\n';
        List<String>toAddresses = new List<String>();
        toAddresses.add(emailValue);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Test');
        email.setToAddresses(toAddresses);
        email.setHtmlBody('Test');
        email.setPlainTextBody('Test');
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('invite.ics');
        efa.setBody(Blob.ValueOf(vCal));
  
        //attachments.add(efa);
        efa.setContentType('text/calendar');
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
         Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }
        catch(Exception e){
            System.debug(e.getMessage()+e.getStackTraceString());
        }
        return null;
    }
    public PageReference googleConnectCall() {
        PageReference pr = new PageReference('https://www.google.com/calendar/render?action=TEMPLATE'+
                            '&text=Scheduling the Meeting at Test Message'+
                            '&dates=20140329T223000Z/20140330T023000Z'+
                            '&details=Body of the event'+
                            '&location=Location Where the meeting is going to hel    d'+
                            '&output=xml');
            System.debug(pr);
        return pr;
    }
    public Pagereference doYahooconnectCall(){
        PageReference pr = new PageReference('https://calendar.yahoo.com/?v=60&view=d'+
                               '&type=20'+
                               '&title=Scheduling the Meeting at Test Message'+
                               '&st=20140329T223000Z&dur=0400'+
                               '&desc=Body of the event' +
                               '&in_loc=Location Where the meeting is going to held');
            System.debug(pr);
        return pr;
    }
}