trigger Interview_Record on Interview__c (before insert, after insert, after update) {
    
    
    // Get name of the candidate
 
    
    if (Trigger.isBefore && Trigger.isInsert) {
        String candidateName;
        for (Interview__c current_record : Trigger.new) {          
           current_record.ownerid=current_record.Interviewer__c;
            current_record.status__c='Open';
            String value=current_record.Candidate__c;
            LIST <Candidate__c> Candidate = [SELECT Candidate_Name__c
                               FROM Candidate__c
                                       WHERE  Id=:value];
            
               for(Candidate__c candidate_record: Candidate){
               candidateName=candidate_record.Candidate_Name__c;
            }
            	current_record.Candidate_Name__c=candidateName;
            value=current_record.Position__c;
            LIST <Position__c> Position = [SELECT Position_Name__c
                               FROM Position__c
                                       WHERE  Id=:value];
            for(Position__c position_record: Position){
               current_record.position_name__c=position_record.Position_Name__c;
            }
                      
            
        } 

     }
    
    if(Trigger.isAfter && trigger.isInsert) {
        String candidateName;
       // Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        for (Interview__c current_record : Trigger.new) {
            Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Interview__c.getRecordTypeInfosById();
            String value=current_record.Candidate__c;
            String recordtype=current_record.RecordTypeId;
            system.debug('People manager record' +recordtype);
            LIST <Candidate__c> Candidate = [SELECT Candidate_Name__c
                               FROM Candidate__c
                                       WHERE  Id=:value];
            
               for(Candidate__c candidate_record: Candidate){
               candidateName=candidate_record.Candidate_Name__c;
                   String rectypename = rtMap.get(current_record.RecordTypeId).getName();
                   
                  
                   if (rectypename =='People Manager'){
                       candidate_record.status__c='People Manager Interview';
                       update candidate_record;
                   }
                   if (rectypename =='Hiring Manager'){
                       candidate_record.status__c='Hiring Manager Interview';
                       update candidate_record;
                   }
                   if (rectypename =='Key Challenger'){
                       candidate_record.status__c='Key Challenger Interview';
                       update candidate_record;
                   }
                   if (rectypename =='Cultural Bar Raiser'){
                       candidate_record.status__c='Cultural Bar Raiser Interview';
                       update candidate_record;
                   }
                   if (rectypename =='Head of Function'){
                       candidate_record.status__c='Head of Function Interview';
                       update candidate_record;
                   }
                   if (rectypename =='EBM'){
                       candidate_record.status__c='EBM Interview';
                       update candidate_record;
                   }
            }
            //
            // Send email to interviewer and to assisstant
            //
            //value=current_record.Recruitment_Coordinator__c;
            //String email;
            //LIST <User> users = [SELECT Email
                //               FROM User
               //                        WHERE  Id=:value];
            
               //for(User user_record: users){
               //email=user_record.Email;
            //}
            
            //String[] toAddresses = new String[] {email};
            //String[] ccAddresses = new String[] {email};     
            //String recordid=current_record.Id;
            //mail.setTargetObjectId(current_record.Interviewer__c);
            //mail.setccAddresses(ccAddresses);
            //mail.setSaveAsActivity(false);
            //mail.setSenderDisplayName('Selection Toolkit');
			//mail.setSubject('New Interview has been scheduled with : ' +candidateName);
            //mail.setBccSender(false);
            //mail.setUseSignature(false);
           // mail.setHtmlBody('Interview with:<b> ' + candidateName +' </b>has been scheduled.<p>'+ current_record.end_time__c +
            //'To view your Interview record access URL  <a href=https://cs43.salesforce.com/'+current_record.Id+'>click here.</a>');
            //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });




            //event  t = new event(	ActivityDate=current_record.Interview_Date__c, 
            //                   StartDateTime=current_record.start_time__c,
             //                  EndDateTime=current_record.end_time__c,
             //                  ownerid=current_record.Interviewer__c,
             //                  Type='Meeting',
             //                  Subject='Interview With '+candidateName,
             //                  Description=current_record.Comments__c,
             //                  WhatId=current_record.Id);
         
            // insert t;
          // EntitySubscription follow = new EntitySubscription (
            //                             parentId = current_record.candidate__c,
              //                           subscriberid =current_record.Interviewer__c);
               // insert follow;
        	}
    }
    if(trigger.isUpdate) {
      //for (Interview__c current_record : Trigger.new) {
      //    if (current_record.Status__c == 'Completed' && current_record.Notes__c != null  && current_record.Notes__c != '')  {
      //      FeedItem post = new FeedItem();

      //      post.ParentId = +current_record.Candidate__c; 

      //      post.Body = current_record.Notes__c;

      //      insert post;
      //    }
      //}
        
    }
    
}