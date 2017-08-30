<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Customer_Concession_Approved_email_alert</fullName>
        <description>Customer Concession Approved email alert</description>
        <protected>false</protected>
        <recipients>
            <field>Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Finance_Email_Templates/Customer_W_9_Request</template>
    </alerts>
    <alerts>
        <fullName>Customer_W_9_Request_Email_alert</fullName>
        <description>Customer W-9 Request Email alert</description>
        <protected>false</protected>
        <recipients>
            <field>Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Finance_Email_Templates/Customer_W_9_Request</template>
    </alerts>
    <alerts>
        <fullName>Final_Rejection_Of_Approval</fullName>
        <description>Final Rejection Of Approval</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Approval_Rejection_email</template>
    </alerts>
    <alerts>
        <fullName>Final_approval_success_email</fullName>
        <description>Final approval success email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/approval_success_email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Mark_as_Approval_flow_launched</fullName>
        <field>Launched_CC_Approval_flow__c</field>
        <literalValue>1</literalValue>
        <name>Mark as Approval flow launched</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_status</fullName>
        <field>Final_approval__c</field>
        <literalValue>1</literalValue>
        <name>Update Approval status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Customer Concession approve email alert when status is Processing</fullName>
        <actions>
            <name>Customer_Concession_Approved_email_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Concession_Request__c.Check_Status__c</field>
            <operation>equals</operation>
            <value>Processing</value>
        </criteriaItems>
        <description>Customer Concession approved is triggered when....Processing is selected as the status of the Check Concession Record.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Concession approved email alert when status is Processing</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Concession_Request__c.Check_Status__c</field>
            <operation>equals</operation>
            <value>Processing</value>
        </criteriaItems>
        <description>Customer Concession approved</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer W-9 Request email for Check Concession</fullName>
        <actions>
            <name>Customer_W_9_Request_Email_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Concession_Request__c.Check_W9_Status__c</field>
            <operation>equals</operation>
            <value>W-9 Requested</value>
        </criteriaItems>
        <description>Customer W-9 Request  is triggered when concession status for W-9 Request is changed to &quot;Requested W-9&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
