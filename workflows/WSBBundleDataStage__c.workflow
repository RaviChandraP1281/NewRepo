<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>RemoveErrorCode</fullName>
        <field>Error_Code__c</field>
        <name>RemoveErrorCode</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RemoveErrorDescription</fullName>
        <field>Error_Description__c</field>
        <name>RemoveErrorDescription</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>RemoveErrorDescription</fullName>
        <actions>
            <name>RemoveErrorCode</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>RemoveErrorDescription</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>WSBBundleDataStage__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Error</value>
        </criteriaItems>
        <description>Remove Error Description when status is set to None</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
