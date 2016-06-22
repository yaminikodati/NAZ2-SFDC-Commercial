/**
 *     @author:  Tomer Glicksman (tglixman@salesforce.com)
 *     @since:   2016-05-29
 *     @desc:    Controller for interview page
 *     @history: 
 */

public with sharing class Interview_Controller {
    public String introduction                                      {get;set;}
    public List<Candidate__c> candidate                             {get;set;}
    public String yourRecordId                                      {get;set;}
    public List<SectionData> sectionDataList                        {get;set;}    
    public List<Integer> numbersList                                {get;set;}
    public Interview__c rec                                         {get;set;}
    public Boolean editMode                                         {get;set;}
    public List<Attachment> attachmentsList                         {get;set;}
    public List<Interview__c> previousInterviews                    {get;set;}
    public static String interviewStr                               {get;set;}
    public Map<String,Decimal> textareaMinimumChar                  {get;set;}

    /**
     *     @desc:    Ctor. initializing data.
     *     @param    activityController - standard controller
     */
    public Interview_Controller(ApexPages.StandardController stdcontroller){
        editMode = false;
        String yourRecordId = ApexPages.currentPage().getParameters().get('id');
        rec = getCurrentRecord(yourRecordId);
        system.debug('rec ctor=' + rec);
        String currentRecordType = rec.RecordType.Name;

        List<Question__c> queryResult = [select Question__c, Competency__c from Question__c WHERE Assessor__c=:currentRecordType AND Competency__c='Introduction' AND Active__C=True];
        introduction = queryResult[0].Question__c;

        sectionDataList = getSectionDataList(currentRecordType);

        numbersList = new List<Integer> { 1,2,3,4,5,6,7,8,9 };
        attachmentsList = getAttachments(rec.Candidate__c);
        previousInterviews = getPreviousInterviews(rec.Candidate__c,rec.Id);

        textareaMinimumChar = getTextareaMinimumChars();
        system.debug('textareaMinimumChar:' + textareaMinimumChar);
    }

    /**
     *      @desc:    getting interview record by given id
     *      @param    id: the interview id
     *      @return   interview record
     */
    public Interview__c getCurrentRecord(String id) {
        return [SELECT Status__c,
                        Interviewer__c,
                        Recruitment_Coordinator__c,
                        Candidate__c,
                        Candidate_Name__c,
                        RecordType.Name,
                        Score_1__c,
                        Score_2__c,
                        Score_3__c,
                        Score_4__c,
                        Selected_Anchors__c,
                        Selected_Question_1__c,
                        Selected_Question_4__c,
                        Selected_Question_3__c,
                        Selected_Question_2__c,
                        Overall_Score1__c,
                        Overall_Score__c,
                        Notes__c,
                        Opportunities__c,
                        Strengths__c
                        FROM Interview__c WHERE Id=:id][0];
    }

    /**
     *      @desc:    getting attachments of the candidate
     *      @param    candidateId: the candidate record id
     *      @return   list of the candidate attachments
     */
    private List<Attachment> getAttachments(String candidateId) {
        List<Attachment> retVal = new List<Attachment>();
        retVal = [SELECT Id, Name, Description, LastModifiedDate, CreatedBy.Name FROM Attachment WHERE ParentId =: candidateId];
        return retVal;
    }

    /**
     *      @desc:    getting the sections data for this specific type of interview
     *      @param    assessor: the interview record type
     *      @return   list of sections settings
     */
    @TestVisible private List<SectionData> getSectionDataList(String assessor) {
        List<SectionData> retVal = new List<SectionData>();               
        List<Interview_Section_Settings__c> sectionSettingsList = [SELECT Intro__c, Assessor__c, Competency__c, Has_Anchor__c, Anchor_Assessor__c FROM Interview_Section_Settings__c WHERE Assessor__c =: assessor AND Is_Active__c = True];
        for (Interview_Section_Settings__c sectionSettings: sectionSettingsList) {
          SectionData sectionData = new sectionData(sectionSettings);
          retVal.add(sectionData);
        }      

        return retVal;
    }

    /**
     *      @desc:    getting minimun characters required for the textareas on the interview page
     *      @return   a mapping between the textarea id and its minimum chars
     */
    private Map<String,Decimal> getTextareaMinimumChars() {
        Map<String,Decimal> retVal = new Map<String,Decimal>();
        List<Textarea_Minimum_Chars__c> minCharList = [SELECT Minimum_Chars__c, Text_Area_Id__c FROM Textarea_Minimum_Chars__c WHERE Is_Active__c = True AND Page_Name__c = 'Interview_View'];
        for (Textarea_Minimum_Chars__c minChar: minCharList) {
           retVal.put(minChar.Text_Area_Id__c,minChar.Minimum_Chars__c);
        }
        return retVal;
    }

    /**
     *      @desc:    getting the previous interviews of the candidate, in order to get notes, opps and strengths from those interviews
     *      @param    candidateId: the candidate
     *      @param    currentInterviewId: the current interview record id     
     *      @return   list of sections settings
     */
    private List<Interview__c> getPreviousInterviews(String candidateId,String currentInterviewId) {
        List<Interview__c> retVal = new List<Interview__c>();
        List<Interview__c> interviews = [SELECT CreatedDate,Notes__c,Strengths__c,Opportunities__c,Interviewer__c,Position__c,Interview_Date__c,RecordType.Name FROM Interview__c WHERE Candidate__c =: candidateId AND Id !=: currentInterviewId];
        for (Interview__c interview:interviews) {
            if ((interview.Notes__c != null && interview.Notes__c != '') || (interview.Opportunities__c != null && interview.Opportunities__c != '') || (interview.Strengths__c != null && interview.Strengths__c != '')) {
                retVal.add(interview);
            }
        }
        return retVal;
    }

    /**
     *      @desc:    an object that represents a single section full data, including its anchors for each type
     */
    public class SectionData {
      public String             sectionIntro        {get; private set;}
      public String             competency          {get; private set;}      
      public Boolean            hasAnchor           {get; private set;}
      public List<Question__c>  questions           {get; private set;}
      public List<Anchor__c>    anchorsUnfavorable  {get; private set;}
      public List<Anchor__c>    anchorsAcceptable   {get; private set;}
      public List<Anchor__c>    anchorsFavorable    {get; private set;}                  

    /**
     *      @desc:    Ctor. gets section settings and constructing the object.
     *      @param    sectionSettings: data about the section (including anchors)
     *      @return   section data
     */
      public SectionData(Interview_Section_Settings__c sectionSettings) {
        this.sectionIntro = sectionSettings.Intro__c;
        this.competency = sectionSettings.Competency__c;
        this.hasAnchor = sectionSettings.Has_Anchor__c;
        this.questions = getQuestions(sectionSettings.Assessor__c, sectionSettings.Competency__c);
        if (sectionSettings.Has_Anchor__c) {
          this.anchorsUnfavorable = getAnchors(sectionSettings.Assessor__c, sectionSettings.Competency__c, Label.Interview_Unfavorable);   
          this.anchorsAcceptable = getAnchors(sectionSettings.Assessor__c, sectionSettings.Competency__c, Label.Interview_Acceptable);     
          this.anchorsFavorable = getAnchors(sectionSettings.Assessor__c, sectionSettings.Competency__c, Label.Interview_Favorable);              
        }
      }

    /**
     *      @desc:    getting list of anchors for section
     *      @param    assessor: the interview record type
     *      @param    competency: the section type
     *      @param    scoreArea: favorable, unfavorable or acceptable 
     *      @return   list of anchors of the same scorearea
     */
      private List<Anchor__c> getAnchors(String assessor, String competency, String scoreArea) {
        return [SELECT Id, Anchor__c FROM Anchor__c WHERE Assessor__c =: assessor AND Competency__c =: competency AND Score_Area__c =: scoreArea AND Active__c=True];
      }

    /**
     *      @desc:    getting list of questions for section 
     *      @param    assessor: the interview record type
     *      @param    competency: the section type
     *      @return   list of questions for the section
     */
      private List<Question__c> getQuestions(String assessor, String competency) {
        return [SELECT Id, Sub_Area__c, Question__c FROM Question__c WHERE Assessor__c =: assessor AND Competency__c =: competency AND Active__C=True ORDER BY Sub_Area__c];
      }
    }

    /**
     *      @desc:    indicating that the page is on edit mode
     */
    public void editInterview() {
        editMode = true;
    }

    /**
     *      @desc:    saving the interview record 
     *      @param    interview: the interview details from the page
     *      @return   string to be displayed on the page popup
     */
    @remoteAction
    public static String saveInterview(Interview__c interview) {
        String retVal = 'ok';
        system.debug('interview @  saveInterview: ' + interview);
        try {
            upsert(interview);        
        } catch (Exception e) {
            system.debug('e.getMessage @  saveInterview: ' + e.getMessage());
            retVal = Label.Interview_Error_Occured + ' ' + e.getMessage();
        }
        return retVal;
    }
}