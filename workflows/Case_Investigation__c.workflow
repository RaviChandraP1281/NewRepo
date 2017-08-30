<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Created_Site_for_Investigation</fullName>
        <description>Update Created Site filed value for Investigationwith  the Agent Partner site information from the USER object</description>
        <field>Created_Site__c</field>
        <formula>CreatedBy.Location__c</formula>
        <name>Update Created Site for Investigation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Created Site for Investigation</fullName>
        <actions>
            <name>Update_Created_Site_for_Investigation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case_Investigation__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>This Workflow rule updates the created site information to the investigation.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
