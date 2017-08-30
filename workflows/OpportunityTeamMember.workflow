<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NewTeamMemberAlertNotification</fullName>
        <description>NewTeamMemberAlertNotification</description>
        <protected>false</protected>
        <recipients>
            <field>UserId</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Oppty_New_Team_Member</template>
    </alerts>
    <rules>
        <fullName>NewTeamMemberCreation</fullName>
        <actions>
            <name>NewTeamMemberAlertNotification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityTeamMember.UserId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityTeamMember.TeamMemberRole</field>
            <operation>notEqual</operation>
            <value>Opportunity Owner,Lead Originator</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
