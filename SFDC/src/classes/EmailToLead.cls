global class EmailToLead implements Messaging.InboundEmailHandler {
 
        global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
            Messaging.InboundEnvelope envelope) {
 
            Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
 
            Lead lead = new Lead();
            lead.FirstName = email.fromname.substring(0,email.fromname.indexOf(' '));
            lead.LastName = email.fromname.substring(email.fromname.indexOf(' '));
            lead.Email = envelope.fromAddress;
            String textBody = email.plainTextBody;
            String companyName;
            if(textBody.indexOf('CompanyName:') > -1) {
                Integer startPos = textBody.indexOf('CompanyName:');
                Integer endPos = textBody.indexOf('.',textBody.indexOf('CompanyName:'));
                companyName = textBody.substring(startPos+'CompanyName:'.length(),endPos);
            }
            lead.Company = companyName != NULL ? companyName : '(not provided)';
            lead.Status = 'Web';
            insert lead;
            return result;
 
        }
 
    }