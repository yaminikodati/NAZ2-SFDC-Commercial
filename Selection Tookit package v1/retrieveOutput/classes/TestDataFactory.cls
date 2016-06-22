public class TestDataFactory {
    
    
    
    public static List<User> createuserrecord() {   
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            List<User> Users = new List<User>();
            User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='Test Candidate');
        return Users;
    }
    

    public static List<Candidate__c> createcandidaterecord() 
    {
        List<Candidate__c> candidates = new List<Candidate__c>();
        Candidate__c candidate = new Candidate__c(Candidate_Name__c='Test Candidate',Email__c='test.candidate@yahooo.com',Phone__c='1-234-55643', Bands__c='III-A', Office__c='NewYork', Position__c='Sales Manager', Status__c='Application Open');
        return candidates;
    }  
    
    public static List<Position__c> createpositionrecord() 
    {
        List<Position__c> positions = new List<Position__c>();
        Position__c position = new Position__c(Position_Name__c='Sales Manager',Role__c='Manager',Status__c='Open', Function__c='Sales', Description__c='This field contains description');
        return positions;
    }  
    
    public static List<Question__c> createquestionrecords() 
    {
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
        return questions;
    } 
    
    public static List<Anchor__c> createanchorrecords() 
    {
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
        return anchors;
    } 
    
    
}