<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AlertRecordApproved</fullName>
        <description>AlertRecordApproved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DiscountApprovedTemplate</template>
    </alerts>
    <alerts>
        <fullName>AlertRecordRejected</fullName>
        <description>AlertRecordRejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DiscountRejectedTemplate</template>
    </alerts>
    <fieldUpdates>
        <fullName>Quote_Set_IsLocked_to_True</fullName>
        <description>Sets the IsLocked field to TRUE</description>
        <field>IsLocked__c</field>
        <literalValue>1</literalValue>
        <name>Quote - Set IsLocked to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Discount_Approval_Status_Test</fullName>
        <field>Siebel_Status_Code__c</field>
        <formula>&quot;Approved&quot;</formula>
        <name>Set Quote Discount Approval Status Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Discount_Rejection_Status_Test</fullName>
        <field>Siebel_Status_Code__c</field>
        <formula>&quot;Rejected&quot;</formula>
        <name>Set Quote Discount Rejection Status Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Discount_Approval_Status_Approved</fullName>
        <description>Updates Quote Discount Approval Status field to &quot;Approved&quot;.</description>
        <field>Discount_Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update_Discount_Approval_Status_Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Discount_Approval_Status_Rejected</fullName>
        <description>Updates Quote Discount Approval Status field to &quot;Rejected&quot;.</description>
        <field>Discount_Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Update_Discount_Approval_Status_Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Lock Quote on Acceptance</fullName>
        <actions>
            <name>Quote_Set_IsLocked_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Quote.Status</field>
            <operation>equals</operation>
            <value>Accepted</value>
        </criteriaItems>
        <description>Fires when a quote status becomes Accepted</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
