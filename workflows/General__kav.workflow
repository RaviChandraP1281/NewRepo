<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Article_URL_Name</fullName>
        <field>UrlName</field>
        <formula>ArticleNumber &amp; &quot;-&quot; &amp; SUBSTITUTE(TEXT(Language), &apos;_&apos;, &apos;-&apos;)</formula>
        <name>Update Article URL Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Article URL Name</fullName>
        <actions>
            <name>Update_Article_URL_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>General__kav.PublishStatus</field>
            <operation>equals</operation>
            <value>Draft</value>
        </criteriaItems>
        <description>Rule to update article url name with article number and languge</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
