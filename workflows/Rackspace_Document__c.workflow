<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notification_on_Payroll_FileUpload_FileExchange</fullName>
        <ccEmails>fullservicesetup@intuit.com</ccEmails>
        <description>Notification on Payroll FileUpload - FileExchange</description>
        <protected>false</protected>
        <recipients>
            <field>DummyEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notification_on_Payroll_FileUpload_FileExchange</template>
    </alerts>
    <rules>
        <fullName>Notification on Payroll FileUpload - FileExchange</fullName>
        <actions>
            <name>Notification_on_Payroll_FileUpload_FileExchange</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>TEXT(File_Exchange__r.Type__c) == &apos;Payroll&apos; &amp;&amp;  $Profile.Name == &apos;File Upload Profile&apos;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
