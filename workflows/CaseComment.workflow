<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Case_Comment_Inactive_Update</fullName>
        <field>Inactivity_Timestamp__c</field>
        <formula>NOW() + ( Parent.Case_Inactive_Threshold__c /24)</formula>
        <name>Case Comment Inactive Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Case Comment Inactive Update</fullName>
        <actions>
            <name>Case_Comment_Inactive_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>if(AND(OR(ISCHANGED( CommentBody ), ISNEW()), NOT( ISPICKVAL(Parent.Status, &quot;Closed&quot;) ) ),true, false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
