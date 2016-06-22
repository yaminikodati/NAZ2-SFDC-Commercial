<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Selection_Toolkit_Send_Email_Notification</fullName>
        <description>Selection Toolkit - Send Email Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Interviewer_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Recruitment_Coordinator_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Selection_Toolkit_Email_Templates/Selection_Toolkit_Interview_Scheduled</template>
    </alerts>
</Workflow>
