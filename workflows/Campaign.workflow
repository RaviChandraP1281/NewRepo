<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Campaign_Status_Completed</fullName>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <name>Campaign Status Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inactivate_Campaign</fullName>
        <description>Set Campaign Active flag to false</description>
        <field>IsActive</field>
        <literalValue>0</literalValue>
        <name>Inactivate Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Renewal Campaign Expired Workflow</fullName>
        <active>true</active>
        <description>When Campaign End Date is passed, set campaign leads to Closed By Admin, and Set Campaign to Inactive (active flag = false)</description>
        <formula>IsActive = True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Inactivate_Campaign</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
