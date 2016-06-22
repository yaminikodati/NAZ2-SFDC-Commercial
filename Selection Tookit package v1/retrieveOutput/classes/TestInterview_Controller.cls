@isTest
public class TestInterview_Controller {

    @isTest static void TestInterviewController() {
         String InterviewId;
        
        //
        //Add a user record
        //
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        list<User> users = new list<User>();
        User campRep1 = new User(Alias = 'cmprep1', Email='campusrep1@testorg1234.com', 
                          EmailEncodingKey='UTF-8', LastName='Rep', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='interviewer@testorg1234.com',
                          Band__c = 'I', Function__c = 'Sales', University__c = 'Duke', Talent_Program__c = 'GMT', Flexible_Scheduling__c = 'Yes'); 
        users.add(campRep1); 
        insert users;
        
         //
        //Add a position record
        //
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        positions.add(position);
        insert positions;
        
         //
        //Add a candidate record
        //
        //
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        candidates.add(candidate);
        insert candidates;
        
         //
        //Add a interview Record
        //
        
        
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
                                       WHERE  UserName='interviewer@testorg1234.com'];
            
               for(User getinterviewer_record: GetInterviewerId){
                    InterviewerId=getinterviewer_record.Id;
             
               }
        
       
        List<Interview__C> interviews = new List<Interview__C>();
        Interview__C interview = new Interview__C(RecordTypeId ='012630000004JoIAAU', Candidate__c=CandidateId, Candidate_Name__c='Test Candidate', Interviewer__C=InterviewerId, Position__c=PositionId, Position_Name__c='Sales Manager', Status__c='Open');
        interviews.add(interview);
        insert interviews;
        
        LIST <Interview__c> GetInterviewId = [SELECT Id
                               FROM Interview__c
                                       WHERE  Candidate_Name__c='Test Candidate'];
            
               for(Interview__c getinterview_record: GetInterviewId){
                        InterviewId=getinterview_record.Id;
             
               }
        
     
        List<Interview_Section_Settings__c> section_settings = new List<Interview_Section_Settings__c>();
        Interview_Section_Settings__c section_setting = new Interview_Section_Settings__c(Name ='People Manager - Dream Big',Assessor__c='People Manager', Competency__c='Dream Big', Has_Anchor__c=True, Intro__c='Select One of the Questions for Big Dream area.'	);
        section_settings.add(section_setting);
        insert section_settings;
        
        
        
        
        
        //
        // Adding test data to questions object
        //
        List<Question__c> questions = new List<Question__c>();
        Question__c question = new Question__c(Active__c=True,Assessor__c='People Manager',Competency__c='Introduction', Sub_Area__c='Lead', Question__c='In 2 minutes, walk me through your resume by highlighting your top achievements');
        questions.add(question);
        questions.add(new Question__c(Active__c=True,Assessor__c='People Manager',Competency__c='Dream Big', Sub_Area__c='Option 1', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='People Manager',Competency__c='Develop People', Sub_Area__c='Option 1', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='People Manager',Competency__c='Interest And Ambition', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Introduction', Sub_Area__c='Lead', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Functional Achievements', Sub_Area__c='Lead', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Functional Achievements', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Key Challenger',Competency__c='Introduction', Sub_Area__c='Lead', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Key Challenger',Competency__c='Industry Knowledge', Sub_Area__c='Option 1', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Key Challenger',Competency__c='Socio Economic', Sub_Area__c='Option 1', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Key Challenger',Competency__c='Connecting The Dots', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Key Challenger',Competency__c='Functional Challenge', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Introduction', Sub_Area__c='Lead', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Dream Big', Sub_Area__c='Option 1', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Develop People', Sub_Area__c='Option 1', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Live Our Culture', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Introduction', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Dream Big', Sub_Area__c='Option 1', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Develop People', Sub_Area__c='Option 1', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Live Our Culture', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Insights', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='EBM',Competency__c='Introduction', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='EBM',Competency__c='Dream Big', Sub_Area__c='Option 1', Question__c='What is your biggest achievement to date? (can be personal or professional)'));
        questions.add(new Question__c(Active__c=True,Assessor__c='EBM',Competency__c='Develop People', Sub_Area__c='Option 1', Question__c='What are the qualities of a favorite leader that you have had?'));
        questions.add(new Question__c(Active__c=True,Assessor__c='EBM',Competency__c='Live Our Culture', Sub_Area__c='Option 1', Question__c='What are your long term career objectives? How do you plan on getting there?'));
        insert questions;
        
        //
        // Adding test data to Anchors object
        //
        
        List<Anchor__c> anchors = new List<Anchor__c>();
        Anchor__c anchor = new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Dream Big',Score_Area__c='Unfavorable',  Anchor__c='Unable to describe relatively specific achievement');
        anchors.add(anchor);
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Dream Big',Score_Area__c='Acceptable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Dream Big',Score_Area__c='Favorable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Develop People',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Develop People',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Develop People',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Interest And Ambition',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Interest And Ambition',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='People Manager',Competency__c='Interest And Ambition',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Functional Achievements',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Functional Achievements',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Hiring Manager',Competency__c='Functional Achievements',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Dream Big',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Dream Big',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Dream Big',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Develop People',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Develop People',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Develop People',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Live Our Culture',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Live Our Culture',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Cultural Bar Raiser',Competency__c='Live Our Culture',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Dream Big',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Dream Big',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Dream Big',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Develop People',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Develop People',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Develop People',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Live Our Culture',Score_Area__c='Unfavorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Live Our Culture',Score_Area__c='Acceptable',  Anchor__c='Sets the bar high and is never happy with the status quo'));
        anchors.add(new Anchor__c(Active__c=True,Assessor__c='Head of Function',Competency__c='Live Our Culture',Score_Area__c='Favorable',  Anchor__c='Provided performance or results-oriented accomplishment '));
        insert anchors;
        

  
        Test.startTest();
       
        PageReference ref = new PageReference('/apex/Interview_View?Id=' + InterviewId); 
        Test.setCurrentPage(ref);
       
        Interview_Controller ctrl = new Interview_Controller( new ApexPages.StandardController( Interview ) );
    

        System.assertEquals(ctrl.introduction,'In 2 minutes, walk me through your resume by highlighting your top achievements');
        System.assertNotEquals(ctrl.yourRecordId,InterviewId);
 
        String results = ctrl.getCurrentRecord(InterviewId).status__c;
        System.assertEquals( results, 'Open'); 
        
        List<Interview_Controller.SectionData> retVal = new List<Interview_Controller.SectionData>();
        retval = ctrl.getSectionDataList('People Manager');
        Integer FoundCompetency=0;
       
        for(Interview_Controller.SectionData getretval: retval){
                        
              if(getretval.competency=='Dream Big'){
                  FoundCompetency=1;
                 }              
        }
        
        
        System.assertEquals(FoundCompetency, 1);
        
  
        ctrl.editInterview();
       

        Test.stopTest();
       
        
    }

}