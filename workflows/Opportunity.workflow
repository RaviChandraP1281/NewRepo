<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>HV_Closed_Won_Opportunity</fullName>
        <ccEmails>carrie_emley@intuit.com</ccEmails>
        <description>HV - Closed Won Opportunity</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer Success Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <senderAddress>system_generated@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/HV_Customer_New_Closed_Won_Oppty</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_email_to_new_Opportunity_Owner</fullName>
        <description>Send notification email to new Opportunity Owner.</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/OpptyNewassignmentnotification</template>
    </alerts>
    <alerts>
        <fullName>tNPS_Opportunity_Survey</fullName>
        <description>tNPS_Opportunity_Survey</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/HTLM_tNPS_Survey_Opporunity</template>
    </alerts>
    <fieldUpdates>
        <fullName>Close_Date_Update</fullName>
        <description>Close Date Update to Today()+30</description>
        <field>CloseDate</field>
        <formula>Today()+30</formula>
        <name>Close Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closing_Channel_Renewal</fullName>
        <field>Closing_Channel__c</field>
        <literalValue>Renewal</literalValue>
        <name>Closing Channel = Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closing_Channel_TeleSales</fullName>
        <field>Closing_Channel__c</field>
        <literalValue>Telesales</literalValue>
        <name>Closing Channel = TeleSales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closing_Channel_Web</fullName>
        <field>Closing_Channel__c</field>
        <literalValue>Web</literalValue>
        <name>Closing Channel = Web</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Threshold_Approve</fullName>
        <field>Threshold_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Threshold Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Closed_Date_to_Todays_Date</fullName>
        <description>Update Opportunity.Closeate to todays date.</description>
        <field>CloseDate</field>
        <formula>Today()</formula>
        <name>Update Closed Date to Todays Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Survey_Sent_Date</fullName>
        <description>After triggering survey email, this field update will store current date value.</description>
        <field>Survey_Sent_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Survey Sent Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Locked_Oppty_Record_Type</fullName>
        <description>Updates Opportunity&apos;s record type to the Locked version.</description>
        <field>RecordTypeId</field>
        <lookupValue>Standard_Opportunity_Locked</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to Locked Oppty Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>SOA_Opportunity_Survey</fullName>
        <apiVersion>38.0</apiVersion>
        <description>The outbound message would trigger action for &quot;Qualtrics&quot; to send survey email</description>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_9EmNqr4XSRZkQ8R&amp;s=SV_dgvj90ZfZfD9FEF&amp;t=TR_blua2b6Ez18XI2h</endpointUrl>
        <fields>AccountId</fields>
        <fields>Asset_Name__c</fields>
        <fields>CAN__c</fields>
        <fields>Contact__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>50002038390@intuit.com.b2b</integrationUser>
        <name>SOA Opportunity Survey</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Sales_tNPS_Survey</fullName>
        <apiVersion>33.0</apiVersion>
        <description>Sales tNPS survey send when an opportunity is closed</description>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_0v6y3ngfW3Ad4Mt&amp;s=SV_aWZ5L0K0q9Ly9N3&amp;t=TR_08N5BzkCnFHEdVP</endpointUrl>
        <fields>AccountId</fields>
        <fields>CAN__c</fields>
        <fields>ContractId</fields>
        <fields>Description</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Opportunity_ID__c</fields>
        <fields>Opportunity_Name__c</fields>
        <fields>OwnerId</fields>
        <fields>Product_Family_of_Interest__c</fields>
        <fields>Type</fields>
        <fields>Won_Lost_Reason__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>10000158292@intuit.com.b2b</integrationUser>
        <name>Sales tNPS Survey</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Close Date Update</fullName>
        <actions>
            <name>Close_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Close Date Update to Today()+30</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>HV Customer New Closed Won Oppty</fullName>
        <actions>
            <name>HV_Closed_Won_Opportunity</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Program_Status__c</field>
            <operation>notEqual</operation>
            <value>Opted Out</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Tier__c</field>
            <operation>equals</operation>
            <value>QB Priority Circle Tier 1,QB Priority Circle Tier 2,QB Priority Circle Tier 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product_Family_of_Interest__c</field>
            <operation>notEqual</operation>
            <value>SalesForce</value>
        </criteriaItems>
        <description>HV Customer New Closed Won Oppty</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Lock Down When Closed Won</fullName>
        <actions>
            <name>Update_to_Locked_Oppty_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>Lock down the Opportunity when Stage is set to Closed Won. This workflow leverages the Locked record type and page layout.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify new Manual Oppty Owner</fullName>
        <actions>
            <name>Send_notification_email_to_new_Opportunity_Owner</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Notify the new Opportunity owner when manually reassigned.</description>
        <formula>ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SOA_Opportunity_Survey</fullName>
        <actions>
            <name>Update_Survey_Sent_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SOA_Opportunity_Survey</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Trigger_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send the survey mail when Opportunity Stage is &quot;Closed Won&quot; and Last survey submitted to the this Contact must be &gt;= 30 days and Opportunity owner belongs to specified profile.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Close Date When Stage is Closed</fullName>
        <actions>
            <name>Update_Closed_Date_to_Todays_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won,Closed Lost</value>
        </criteriaItems>
        <description>When Opportunity stage changes to Closed Won or Closed Lost, update the Closed Date to todays date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Closing Channel to Renewal</fullName>
        <actions>
            <name>Closing_Channel_Renewal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updating closing channel to renewal, when Opportunity is closed and owner is Data Migration.</description>
        <formula>AND(ISPICKVAL(StageName, &apos;Closed Won&apos;) , ISCHANGED(StageName),   Opportunity_Owner_Read_Only__c  = &apos;Data Migration&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Closing Channel to Telesales</fullName>
        <actions>
            <name>Closing_Channel_TeleSales</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updating closing channel to telesales, when Opportunity is closed and owner is not online user &amp; Data migration.</description>
        <formula>AND(ISPICKVAL(StageName, &apos;Closed Won&apos;) , ISCHANGED(StageName),   Opportunity_Owner_Read_Only__c  &lt;&gt; &apos;online user&apos;, Opportunity_Owner_Read_Only__c &lt;&gt; &apos;Data Migration&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Closing Channel to Web</fullName>
        <actions>
            <name>Closing_Channel_Web</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updating closing channel to web, when Opportunity is closed and owner is online user.</description>
        <formula>AND( ISPICKVAL(StageName, &apos;Closed Won&apos;), ISCHANGED(StageName ),   Opportunity_Owner_Read_Only__c  = &apos;online user&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>tNPS_Opportunity_Survey</fullName>
        <actions>
            <name>Sales_tNPS_Survey</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>To send Survey Mail when Opportunity is Closed Won or Closed Lost</description>
        <formula>IF(ISPICKVAL(StageName, &apos;Closed Lost&apos;),true,IF(ISPICKVAL(StageName, &apos;Closed Won&apos;),true,false))&amp;&amp;  Owner.Nps_Last_emailsent__c ==TODAY() &amp;&amp; Owner.Send_Email__c == true  &amp;&amp;  $User.Alias  &lt;&gt; &apos;dmigr&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
