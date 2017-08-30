<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Default_Line_Desc</fullName>
        <field>Description</field>
        <formula>Product2.Description</formula>
        <name>Default Line Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Usage_Range_From</fullName>
        <field>Usage_Range_From__c</field>
        <formula>Product2.Usage_Range_From__c</formula>
        <name>Default Usage Range From</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Usage_Range_To</fullName>
        <field>Usage_Range_To__c</field>
        <formula>Product2.Usage_Range_To__c</formula>
        <name>Default Usage Range To</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contract_Value</fullName>
        <field>Contract_Value__c</field>
        <formula>IF( Product_Unit__c= &apos;Per Month&apos; &amp;&amp;  Billing__c = &apos;Monthly Recurring&apos; ,  UnitPrice *12 , IF( Product_Unit__c= &apos;Each&apos; &amp;&amp;  Billing__c = &apos;One Time&apos; ,  (UnitPrice/45)*12 , IF( Product_Unit__c= &apos;Per Year&apos; &amp;&amp;  Billing__c = &apos;Annual Recurring&apos; ,  UnitPrice , 0)))</formula>
        <name>Update Contract Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Default Line Item</fullName>
        <actions>
            <name>Default_Line_Desc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Default_Usage_Range_From</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Default_Usage_Range_To</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>QuoteLineItem.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Contract Value</fullName>
        <actions>
            <name>Update_Contract_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>QuoteLineItem.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
