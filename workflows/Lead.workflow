<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_notification_email_to_new_Lead_Owner</fullName>
        <description>Send notification email to new Lead Owner.</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/LeadsNewassignmentnotification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Lead_Country_Std</fullName>
        <description>Set Lead Standard Country field when the Custom country field value is set</description>
        <field>Country</field>
        <formula>TEXT(Country__c)</formula>
        <name>Set Lead Country Std</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Owner_Pivot</fullName>
        <description>Update this field to the OwnerId of the just previous owner. This will mostly be a Queue, we need this to happen so we can get a new transaction into place to send the notification email using a workflow.</description>
        <field>Email_Owner_Pivot__c</field>
        <formula>OwnerId</formula>
        <name>Update Email Owner Pivot</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Initial_Response_Time</fullName>
        <field>Initial_Response_Time__c</field>
        <formula>(Now() - CreatedDate) * 1440</formula>
        <name>Update_Initial_Response_Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Status_Changed_Time</fullName>
        <description>Update Lead status changed time</description>
        <field>Lead_Status_Changed_Time__c</field>
        <formula>Now()</formula>
        <name>Update_Lead_Status_Changed_Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_standard_Postal_Code_field</fullName>
        <field>PostalCode</field>
        <formula>Postal_Code__c</formula>
        <name>Update standard Postal Code field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Lead Status Changed From New</fullName>
        <actions>
            <name>Update_Initial_Response_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Lead_Status_Changed_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update on Initial Response time based on the Status change</description>
        <formula>AND(ISCHANGED(Status),ISPICKVAL(PRIORVALUE(Status),&apos;New&apos;), ISBLANK( Initial_Response_Time__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify new Chat Manual Lead Owner</fullName>
        <actions>
            <name>Send_notification_email_to_new_Lead_Owner</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send new Owner notification.</description>
        <formula>AND( 
ISPICKVAL(LeadSource, &apos;Chat&apos;), 
ISCHANGED(OwnerId), 
IsConverted == false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify new Manual Lead Owner</fullName>
        <actions>
            <name>Send_notification_email_to_new_Lead_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send new Owner notification.</description>
        <formula>AND(ISPICKVAL(LeadSource, &apos;Web&apos;), LEFT(OwnerId, 3) == &apos;005&apos;, ISNEW()) || AND(LEFT(OwnerId, 3) == &apos;005&apos;, ISCHANGED(OwnerId),  IsConverted == false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify new Manual Lead Owner %28Prequel%29</fullName>
        <actions>
            <name>Update_Email_Owner_Pivot</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Need a prequel workflow to get the Email Owner Pivot updated first, then get a new transaction into place to send the email to the correct new owner.</description>
        <formula>AND(ISPICKVAL(LeadSource, &apos;Web&apos;), Email_Owner_Pivot__c == null)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Lead Country Std</fullName>
        <actions>
            <name>Set_Lead_Country_Std</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Converted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Country</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Set Lead Country standard field with the Custom field value</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Standard Postal Code</fullName>
        <actions>
            <name>Update_standard_Postal_Code_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Postal_Code__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Update standard Postal Code from custom version.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>ATTENTION_New_SLA_Lead</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.SLA_Creation_Timestamp__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ATTENTION: New Lead with Contact Time SLA has been assigned to you.</subject>
    </tasks>
</Workflow>
