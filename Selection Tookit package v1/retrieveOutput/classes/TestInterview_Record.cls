@isTest
public class TestInterview_Record {
    String CandidateId;
    
    @isTest static void TestInterviewRecordCandidateStatusPeopleManager() {
   
   
   
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);
        
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;
        
        
        
        
        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        
        
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004JoIAAU', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
        
        
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='People Manager Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               }
        
      
        
        
        
Test.stopTest();
        
}
    
    @isTest static void TestInterviewRecordCandidateStatusHiringManager() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];       
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);       
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;

        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004JoN', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
  
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='Hiring Manager Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               }
    
Test.stopTest();
        
}
        @isTest static void TestInterviewRecordCandidateKeyChallengerInterview() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];       
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);       
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;

        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004JoS', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
  
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='Key Challenger Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               
               }
    
Test.stopTest();
        
}
        @isTest static void TestInterviewRecordCandidateStatusCulturalBarRaiserInterview() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];       
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);       
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;

        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004JoX', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
  
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='Cultural Bar Raiser Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               }
    
Test.stopTest();
        
}
        @isTest static void TestInterviewRecordCandidateStatusHeadofFunctionInterview() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];       
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);       
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;

        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004Joc', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
  
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='Head of Function Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               }
    
Test.stopTest();
        
}
        @isTest static void TestInterviewRecordCandidateStatusEBMInterview() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];       
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='camprep1@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1);       
        insert users;
        
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;

        String CandidateId;
        String InterviewerId;
        String PositionId;
        
        LIST <Position__c> GetPositionId = [SELECT Id
                               FROM Position__c
                                       WHERE  Position_Name__c='Sales Manager'];
            
               for(Position__c getposition_record: GetPositionId){
                    PositionId=getposition_record.Id;
             
               }
        LIST <Candidate__c> GetCandidateId = [SELECT Id
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c getcandidate_record: GetCandidateId){
                    CandidateId=getcandidate_record.Id;
             
               }
        
         LIST <User> GetInterviewerId = [SELECT Id
                               FROM User
                                       WHERE  UserName='camprep1@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
        System.debug('Candidate ID: ' + CandidateId);
        System.debug('Interview ID: ' + InterviewerId);
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004Joh', Candidate__c=CandidateId, Interviewer__C=InterviewerId, Position__c=PositionId);
        interviews.add(interview);
        insert interviews;
  
        Test.startTest();
        
            LIST <Candidate__c> Candidatess = [SELECT Candidate_Name__c, Status__c
                               FROM Candidate__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Candidate__c candidate_record: Candidatess){
                   System.assert(candidate_record.Status__c =='EBM Interview');
               
               }
        
        LIST <Interview__c> Interviewss = [SELECT OwnerId, Position_Name__c
                               FROM Interview__c
                                       WHERE  Candidate__c=:CandidateId];
            
               for(Interview__c interview_record: Interviewss){
                   System.debug('Interview Record: ' + interview_record);
                   System.assert(interview_record.OwnerId==InterviewerId);
                   System.assert(interview_record.Position_Name__c=='Sales Manager');
               
               }
    
Test.stopTest();
        
}
    
    
    
    
    
    
    
}