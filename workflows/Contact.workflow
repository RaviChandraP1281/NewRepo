<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Reset_Skip_FN_LN_Validations_Flag</fullName>
        <field>SkipFNLNValidation__c</field>
        <literalValue>0</literalValue>
        <name>Reset Skip FN-LN Validations Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_CompanyId</fullName>
        <field>Company_ID__c</field>
        <formula>Account.Company_ID__c</formula>
        <name>Update CompanyId</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Reset Skip FNLN Validations Flag</fullName>
        <actions>
            <name>Reset_Skip_FN_LN_Validations_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.SkipFNLNValidation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update CompanyId</fullName>
        <actions>
            <name>Update_CompanyId</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Account.Company_ID__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
