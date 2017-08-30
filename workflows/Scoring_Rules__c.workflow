<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Populate_PFoI_Unique</fullName>
        <description>Populate from Product Family of Interest.</description>
        <field>PFoI_Unique__c</field>
        <formula>TEXT(Product_Family_of_Interest__c)</formula>
        <name>Populate PFoI Unique</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Enforce PFoI uniqueness</fullName>
        <actions>
            <name>Populate_PFoI_Unique</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Scoring_Rules__c.Product_Family_of_Interest__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Enforces the uniqueness of the Product Family of Interest field per org.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
