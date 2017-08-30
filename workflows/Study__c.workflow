<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Recruiter_Study_Email_Notification_alert</fullName>
        <description>Recruiter Study Email Notification alert</description>
        <protected>false</protected>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Assignment_of_Recruiter_Notification_Html</template>
    </alerts>
    <alerts>
        <fullName>Send_Technology_Email</fullName>
        <description>Send Technology Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>50002038357@intuit.com.b2b</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Technology_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_Technology_Email_24_hrs_before_study</fullName>
        <description>Send Technology Email 24 hrs before study</description>
        <protected>false</protected>
        <recipients>
            <recipient>50002038357@intuit.com.b2b</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Technology_Notification</template>
    </alerts>
    <rules>
        <fullName>Recruiter Study Assignment Notification</fullName>
        <actions>
            <name>Recruiter_Study_Email_Notification_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Study__c.Recruiter__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Technology Notification</fullName>
        <actions>
            <name>Send_Technology_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Technology__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Technology_Email_24_hrs_before_study</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Study__c.Start_Date_of_Study__c</offsetFromField>
            <timeLength>-24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
