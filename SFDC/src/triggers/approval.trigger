// change on jan 06 2015 - new test
trigger approval on amount__c (after insert) 
{
 for (Integer i = 0; i < Trigger.new.size(); i++) 
 {
 
        if (Trigger.new[i].amount__c > 50)
        { 
 
            // create the new approval request to submit
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            req.setObjectId(Trigger.new[i].Id);
            // submit the approval request for processing
            Approval.ProcessResult result = Approval.process(req);
            // display if the reqeust was successful
            System.debug('Submitted for approval successfully: '+result.isSuccess());
           }
 
}
}