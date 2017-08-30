<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>HV_Negative_VOC_Received2</fullName>
        <description>HV - Negative VOC Received</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer Success Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <senderAddress>system_generated@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/HV_Neg_VOC_Notification</template>
    </alerts>
    <rules>
        <fullName>HV Neg VOC Notification</fullName>
        <actions>
            <name>HV_Negative_VOC_Received2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VOC_Survey_Response__c.Question_Response1__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <description>HV Neg VOC Notification</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Neg VOC Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>VOC_Survey_Response__c.Question_Response1__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <description>Neg VOC Notification</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>VOC_Survey_Response__c.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
