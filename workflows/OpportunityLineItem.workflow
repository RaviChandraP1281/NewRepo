<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>UniqueOpportunityLineItem</fullName>
        <field>UniqueLineItem__c</field>
        <formula>OpportunityId &amp; Product2Id</formula>
        <name>UniqueOpportunityLineItem</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>UniqueOpportunityLineItem</fullName>
        <actions>
            <name>UniqueOpportunityLineItem</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND ( NOT ISBLANK(Opportunity.Company_ID__c), 
(($User.Alias) &lt;&gt; &quot;ouser&quot;), 
OR( 
ISNEW(), 
ISCHANGED( Product2Id ) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
