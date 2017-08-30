<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Ultimate_Parent_Update</fullName>
        <field>Top_Level_Account_Text__c</field>
        <formula>Top_Level_Account__c  &amp; 
MID(&quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ012345&quot;,( 
IF(FIND(MID(Top_Level_Account__c ,1,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,1,0) 
+IF(FIND(MID(Top_Level_Account__c ,2,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,2,0) 
+IF(FIND(MID(Top_Level_Account__c ,3,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,4,0) 
+IF(FIND(MID(Top_Level_Account__c ,4,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,8,0) 
+IF(FIND(MID(Top_Level_Account__c ,5,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,16,0) 
)+1,1) 
&amp; 
MID(&quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ012345&quot;,( 
IF(FIND(MID(Top_Level_Account__c ,6,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,1,0) 
+IF(FIND(MID(Top_Level_Account__c ,7,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,2,0) 
+IF(FIND(MID(Top_Level_Account__c ,8,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,4,0) 
+IF(FIND(MID(Top_Level_Account__c ,9,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,8,0) 
+IF(FIND(MID(Top_Level_Account__c ,10,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,16,0) 
)+1,1) 
&amp; 
MID(&quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ012345&quot;,( 
IF(FIND(MID(Top_Level_Account__c ,11,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,1,0) 
+IF(FIND(MID(Top_Level_Account__c ,12,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,2,0) 
+IF(FIND(MID(Top_Level_Account__c ,13,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,4,0) 
+IF(FIND(MID(Top_Level_Account__c ,14,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,8,0) 
+IF(FIND(MID(Top_Level_Account__c ,15,1), &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZ&quot;)&gt;0,16,0) 
)+1,1)</formula>
        <name>Account Ultimate Parent Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ultimate_Parent_Update2</fullName>
        <field>Top_Level_Account_Text__c</field>
        <name>Account_Ultimate_Parent_Update2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Account_Phone_Number</fullName>
        <field>Phone</field>
        <name>Clear Account Phone Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetPartnerId</fullName>
        <field>Partner_Id__c</field>
        <name>ResetPartnerId</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetPartnerName</fullName>
        <field>Partner_Name__c</field>
        <name>ResetPartnerName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateStage</fullName>
        <field>Account_Stage__c</field>
        <literalValue>Awareness</literalValue>
        <name>UpdateStage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>SFDCTOSIEBEL_ACCOUNT</fullName>
        <apiVersion>28.0</apiVersion>
        <endpointUrl>https://app.informaticaondemand.com/saas/api/1/salesforceoutboundmessage/WVvfBu3jerTpfhVS9BZEK7Hi7gwHsbSw</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Status__c</fields>
        <fields>Type</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>10000178061@intuit.com.b2b</integrationUser>
        <name>SFDCTOSIEBEL_ACCOUNT</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Lead Conversion - Clear Phone Number</fullName>
        <actions>
            <name>Clear_Account_Phone_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Lead_Conversion_Flag__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Test for Phone number - should be only on Contact and not on Account</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PostdefaultAccountStageifnull</fullName>
        <actions>
            <name>UpdateStage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISPICKVAL(Account_Stage__c,&apos;&apos;),ISPICKVAL(Customer_Type__c,&apos;Partner&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ResetPartnerFieldsRule</fullName>
        <actions>
            <name>ResetPartnerId</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ResetPartnerName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Customer_Type__c</field>
            <operation>notEqual</operation>
            <value>Partner</value>
        </criteriaItems>
        <description>This rule will nullify the partner id and partner name fields if the value of the customer type is changed from partner to any other.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SFDCTOSIEBEL_ACCOUNT</fullName>
        <actions>
            <name>SFDCTOSIEBEL_ACCOUNT</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>1=1</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateAccountParentText</fullName>
        <actions>
            <name>Account_Ultimate_Parent_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow to update Account Ultimate Parent field on a Account.</description>
        <formula>ISBLANK(Top_Level_Account_Text__c )  ||  ISCHANGED(  Top_Level_Account__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
