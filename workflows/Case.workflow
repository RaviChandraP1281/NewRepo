<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FDS_Agent_Generated_Closed_Case_Automated</fullName>
        <description>FDS Agent Generated Closed Case Automated</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>qbocaresupport@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>FDS_Templates/QBOE_Case_Resolved_Response</template>
    </alerts>
    <alerts>
        <fullName>FDS_Customer_Generated_Closed_Case_Automated</fullName>
        <description>FDS Customer Generated Closed Case Automated</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>qbocaresupport@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>FDS_Templates/QBOE_Escalation_Resolved_Response</template>
    </alerts>
    <alerts>
        <fullName>HV_CARE_Case_Escalated</fullName>
        <ccEmails>carrie_emley@intuit.com</ccEmails>
        <ccEmails>dalton_maffet@intuit.com</ccEmails>
        <ccEmails>julie_kirtley@intuit.com</ccEmails>
        <description>HV - CARE Case Escalated</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer Success Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <senderAddress>system_generated@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/HV_Case_Escalated</template>
    </alerts>
    <alerts>
        <fullName>HV_CARE_Case_Opened</fullName>
        <ccEmails>carrie_emley@intuit.com</ccEmails>
        <description>HV - CARE Case Opened</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer Success Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <senderAddress>system_generated@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/HV_Case_Created_Notification</template>
    </alerts>
    <alerts>
        <fullName>PTG_Auto_Response_on_Case_Creation</fullName>
        <description>PTG Auto Response on  Case Creation</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>system_generated@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Case_Auto_Response_Templates/PTG_Auto_Response_Template</template>
    </alerts>
    <alerts>
        <fullName>Studio_Request_Email_Notification_alert</fullName>
        <description>Studio Request Email Notification alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Studio_new_case_creation_notification_HTML</template>
    </alerts>
    <alerts>
        <fullName>Studio_Request_Email_Notification_alert_lab_Request</fullName>
        <ccEmails>adityatech4u@gmail.com</ccEmails>
        <description>Studio Request Email Notification alert lab Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>50002015651@intuit.com.b2b</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Studio_new_case_creation_notification_HTML_lab_request</template>
    </alerts>
    <alerts>
        <fullName>VOC_Survey</fullName>
        <description>VOC Survey</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/VOC_Survey</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_AU_en_AU</fullName>
        <description>eCase Auto-Reply Responses - AU (en_AU)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_AU_en_AU</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_Brazil_pt_BR</fullName>
        <description>eCase Auto-Reply Responses - Brazil (pt_BR)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_Brazil_pt_BR</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_Canada_English_en_CA</fullName>
        <description>eCase Auto-Reply Responses - Canada English (en_CA)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_Canada_English_en_CA</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_Canada_French_fr_CA</fullName>
        <description>eCase Auto-Reply Responses - Canada French (fr_CA)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_Canada_French_fr_CA</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_France_fr_FR</fullName>
        <description>eCase Auto-Reply Responses - France (fr_FR)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_France_fr_FR</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_India_en_IN</fullName>
        <description>eCase Auto-Reply Responses - India (en_IN)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_India_en_IN</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_ROW_HK_en_HK</fullName>
        <description>eCase Auto-Reply Responses - ROW HK (en_HK)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_ROW_HK_en_HK</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_ROW_MY_en_MY</fullName>
        <description>eCase Auto-Reply Responses - ROW MY (en_MY)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_ROW_MY_en_MY</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_ROW_SG_en_SG</fullName>
        <description>eCase Auto-Reply Responses - ROW SG (en_SG)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_ROW_SG_en_SG</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_ROW_en_UN</fullName>
        <description>eCase Auto-Reply Responses - ROW (en_UN)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_ROW_en_UN</template>
    </alerts>
    <alerts>
        <fullName>eCase_Auto_Reply_Responses_UK_en_GB</fullName>
        <description>eCase Auto-Reply Responses - UK (en_GB)</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>no_response@intuit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_Reply_Email_for_eCases/eCase_Auto_Reply_Responses_UK_en_GB</template>
    </alerts>
    <alerts>
        <fullName>tNPS_Survey</fullName>
        <description>tNPS Survey</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/HTML_tNPS_Care_Survey</template>
    </alerts>
    <fieldUpdates>
        <fullName>Case_Inactive_Timestamp_Update</fullName>
        <field>Inactivity_Timestamp__c</field>
        <formula>NOW() + (Case_Inactive_Threshold__c/24)</formula>
        <name>Case_Inactive_Timestamp_Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Search_Details_Update</fullName>
        <field>Case_Contact_Email__c</field>
        <formula>Contact.Email</formula>
        <name>Case Search Details Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Search_Details_Update_First_Name</fullName>
        <field>Case_Contact_First_Name__c</field>
        <formula>Contact.FirstName</formula>
        <name>Case Search Details Update First Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Search_Details_Update_Last_Name</fullName>
        <field>Case_Contact_Last_Name__c</field>
        <formula>Contact.LastName</formula>
        <name>Case Search Details Update Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Survey_Send_Date</fullName>
        <field>SurveySendDate__c</field>
        <formula>NOW()</formula>
        <name>Case Survey Send Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_MV_Count</fullName>
        <description>Increment MV Count Field by  1</description>
        <field>MV_Count__c</field>
        <formula>(IF(ISBLANK(MV_Count__c), 0, MV_Count__c) + 1)</formula>
        <name>Increment MV Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prevent_Survey_Retrigger</fullName>
        <description>To Suppress the Survey from being retriggered when Close Case gets updated</description>
        <field>Suppress_Survey_Retrigger__c</field>
        <literalValue>1</literalValue>
        <name>Prevent Survey Retrigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sub_Status</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Resolved</literalValue>
        <name>Update Sub-Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Survey_Stage</fullName>
        <field>Survey_Stage__c</field>
        <literalValue>Survey Triggered</literalValue>
        <name>Update Survey Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>test</fullName>
        <field>Type</field>
        <literalValue>Activate / Install / Setup</literalValue>
        <name>test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Send_Care_tNPS_Survey</fullName>
        <apiVersion>33.0</apiVersion>
        <description>Send the EBS Care tNPS agent survey</description>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_0v6y3ngfW3Ad4Mt&amp;s=SV_7QCYbcPCnpqpZfT&amp;t=TR_3dBc2OCpoi5BjHD</endpointUrl>
        <fields>AccountId</fields>
        <fields>Area__c</fields>
        <fields>CaseNumber</fields>
        <fields>CaseOwnerFullName__c</fields>
        <fields>Case_Owner_First_Name__c</fields>
        <fields>Case_Owner_Manager_Id__c</fields>
        <fields>ClosedDate</fields>
        <fields>ContactId</fields>
        <fields>Contact_First_Name__c</fields>
        <fields>Contact_Last_Name__c</fields>
        <fields>Contact_TimeZone__c</fields>
        <fields>CreatedDate</fields>
        <fields>Description</fields>
        <fields>Id</fields>
        <fields>Origin</fields>
        <fields>OwnerId</fields>
        <fields>Priority</fields>
        <fields>Status</fields>
        <fields>Sub_Status__c</fields>
        <fields>Subarea__c</fields>
        <fields>Subject</fields>
        <fields>VOCSurveyLangCode__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>10000158292@intuit.com.b2b</integrationUser>
        <name>Send Care tNPS Survey</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>VOCSurvey_Qualtrics_AAG</fullName>
        <apiVersion>32.0</apiVersion>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_extaWdxqgRAknsx&amp;s=SV_3qrb9v8c7iSVXSJ&amp;t=TR_0lBrP9XzZUUd2L3</endpointUrl>
        <fields>CaseNumber</fields>
        <fields>CaseOwnerFullName__c</fields>
        <fields>Case_Email__c</fields>
        <fields>Case_Owner_First_Name__c</fields>
        <fields>Case_Owner_Manager_Id__c</fields>
        <fields>ClosedDate</fields>
        <fields>Contact_First_Name__c</fields>
        <fields>Contact_Last_Name__c</fields>
        <fields>Id</fields>
        <fields>VOCSurveyLangCode__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>50001973125@intuit.com.b2b</integrationUser>
        <name>VOCSurvey-Qualtrics-AAG</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>VOCSurvey_Qualtrics_PTG</fullName>
        <apiVersion>32.0</apiVersion>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_bflDCLtL7epu6kR&amp;s=SV_3CMFR4U8Bw1IPmR&amp;t=TR_3IeKQlap0PevAjj</endpointUrl>
        <fields>CaseNumber</fields>
        <fields>CaseOwnerFullName__c</fields>
        <fields>Case_Email__c</fields>
        <fields>Case_Owner_First_Name__c</fields>
        <fields>Case_Owner_Manager_Id__c</fields>
        <fields>ClosedDate</fields>
        <fields>Contact_First_Name__c</fields>
        <fields>Contact_Last_Name__c</fields>
        <fields>Id</fields>
        <fields>VOCSurveyLangCode__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>50001973125@intuit.com.b2b</integrationUser>
        <name>VOCSurvey-Qualtrics-PTG</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>VOCSurvey_Qualtrics_PTG_Onboarding</fullName>
        <apiVersion>38.0</apiVersion>
        <description>The Survey for PCG Onboarding feedback</description>
        <endpointUrl>https://intuitcare.qualtrics.com/WRQualtricsServer/sfApi.php?r=outboundMessage&amp;u=UR_bflDCLtL7epu6kR&amp;s=SV_9RikP6V8y5eTWap&amp;t=TR_3IeKQlap0PevAjj</endpointUrl>
        <fields>CaseNumber</fields>
        <fields>CaseOwnerFullName__c</fields>
        <fields>Case_Email__c</fields>
        <fields>Case_Owner_First_Name__c</fields>
        <fields>Case_Owner_Manager_Id__c</fields>
        <fields>ClosedDate</fields>
        <fields>Contact_First_Name__c</fields>
        <fields>Contact_Last_Name__c</fields>
        <fields>Id</fields>
        <fields>VOCSurveyLangCode__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>50001973125@intuit.com.b2b</integrationUser>
        <name>VOCSurvey-Qualtrics-PTG_Onboarding</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>CSM Case Created Notification</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Program_Status__c</field>
            <operation>equals</operation>
            <value>Engaged</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Search Details Update</fullName>
        <actions>
            <name>Case_Search_Details_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Search_Details_Update_First_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Search_Details_Update_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This Helps populate the Fields on Case for global search</description>
        <formula>IF(OR(NOT(ISPICKVAL(Status, &quot;Closed&quot;)),  ISNEW(), ISCLONE()  ) , if( OR(Case_Contact_First_Name__c &lt;&gt;  Contact.FirstName, Case_Contact_Last_Name__c &lt;&gt;  Contact.LastName,  Case_Contact_Email__c  &lt;&gt;   Contact.Email), true, false),false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case_Inactive_Timestamp_Update</fullName>
        <actions>
            <name>Case_Inactive_Timestamp_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( ISPICKVAL(Status, &quot;Closed&quot;) , false,  IF( ISNULL(Case_Inactive_Threshold__c) , false,  IF( OR( ISCHANGED( Sub_Status__c ) , ISCHANGED( OwnerId )) , true, false) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FDS Process notify Agent when Case is Closed</fullName>
        <actions>
            <name>FDS_Agent_Generated_Closed_Case_Automated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>IFIG CustomerCentral Tier 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Phone</value>
        </criteriaItems>
        <description>This is to notify Agent when the case they submitted online has been closed</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FDS Process notify Customer when Case is Closed</fullName>
        <actions>
            <name>FDS_Customer_Generated_Closed_Case_Automated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>IFIG CustomerCentral Tier 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>In-Product</value>
        </criteriaItems>
        <description>This is to notify Customers when the case they submitted online has been closed</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>HV Care Case Opened</fullName>
        <actions>
            <name>HV_CARE_Case_Opened</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Program_Status__c</field>
            <operation>notEqual</operation>
            <value>Not Engaged,Opted Out</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Tier__c</field>
            <operation>equals</operation>
            <value>QB Priority Circle Tier 1,QB Priority Circle Tier 2,QB Priority Circle Tier 3</value>
        </criteriaItems>
        <description>HV Care Case Opened</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>HV Care Case Opened Task Creation</fullName>
        <actions>
            <name>Case_Follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Program_Status__c</field>
            <operation>equals</operation>
            <value>Engaged</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Tier__c</field>
            <operation>equals</operation>
            <value>QB Priority Circle Tier 1,QB Priority Circle Tier 2,QB Priority Circle Tier 3</value>
        </criteriaItems>
        <description>HV Care Case Opened Task Creation - CSM Follow-up</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>HV Case Escalated</fullName>
        <actions>
            <name>HV_CARE_Case_Escalated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Program_Status__c</field>
            <operation>notEqual</operation>
            <value>Not Engaged,Opted Out</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Tier__c</field>
            <operation>equals</operation>
            <value>QB Priority Circle Tier 1,QB Priority Circle Tier 2,QB Priority Circle Tier 3</value>
        </criteriaItems>
        <description>HV Case Escalated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Case.LastModifiedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>MV Count</fullName>
        <actions>
            <name>Increment_MV_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Increment MV_Count__c field whenever case is assigned to MV Queue or Holding Queue</description>
        <formula>AND(ISCHANGED(OwnerId),OR((Owner:Queue.DeveloperName = &apos;IFIG_CustomerCentral_MV_Scripts&apos;),(Owner:Queue.DeveloperName = &apos;QO_FW_CC_Holding&apos;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PTG Auto Response on  Case Creation</fullName>
        <actions>
            <name>PTG_Auto_Response_on_Case_Creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Email_Alert_on_Case_Creation_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.AppId__c</field>
            <operation>equals</operation>
            <value>Intuit.apd.lacerte-tax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.AppId__c</field>
            <operation>equals</operation>
            <value>Intuit.platform.lacertetax.lacertetaxty15</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.AppId__c</field>
            <operation>equals</operation>
            <value>Intuit.tax.lacertewindowsdesktop.ty14lacertewindowsdesktop</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Send Suvey 1 hour</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Studio Case Creation Email Notification</fullName>
        <actions>
            <name>Studio_Request_Email_Notification_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Request_Type__c</field>
            <operation>equals</operation>
            <value>Office Hours</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Request_Type__c</field>
            <operation>equals</operation>
            <value>Study Request</value>
        </criteriaItems>
        <description>This workflow notifies head of Studio team, when Study request is rasied</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Studio Case Creation Email Notification Lab Request</fullName>
        <actions>
            <name>Studio_Request_Email_Notification_alert_lab_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Case.Request_Type__c</field>
            <operation>equals</operation>
            <value>Lab Space</value>
        </criteriaItems>
        <description>This workflow notifies head of Studio team, when Study request is rasied</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>VOC Survey</fullName>
        <active>false</active>
        <description>VOC Survey for Customers. One Mail is sent once in 7 Days for a Closed Case</description>
        <formula>IsClosed &amp;&amp;  Contact.VOC_Last_emailsent__c ==TODAY() &amp;&amp;  Contact.Send_Email__c == true &amp;&amp;  Contact.Email != null &amp;&amp; IF(CASE(Contact.Primary_Language__c, &quot;&quot;,0,1)=0,IF( Owner:User.Agent_Locale__c  =&quot;en_US&quot;,TRUE,FALSE),IF(ISPICKVAL(Contact.Primary_Language__c,&quot;English&quot;) ,TRUE,FALSE))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>VOC_Survey</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Send_Email_Time__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>VOCSurvey-Qualtrics-AAG</fullName>
        <actions>
            <name>Case_Survey_Send_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prevent_Survey_Retrigger</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Survey_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>VOCSurvey_Qualtrics_AAG</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>VOC survey for SBG / AAG.</description>
        <formula>AND( ISPICKVAL(Status,&apos;Closed&apos;), IF((ContactId = null &amp;&amp; SuppliedEmail != null), true ,IF((Send_Email__c = true),true,false)), NOT(CONTAINS($UserRole.Name, &apos;Renewals Consultant&apos;)) ,NOT(CONTAINS($UserRole.Name, &apos;PTG&apos;)), NOT(CONTAINS($Label.ProfileToExcludeVOCSurvey ,$Profile.Name)), NOT(CONTAINS($User.Username, &apos;dmigr&apos;)) , Suppress_Survey_Retrigger__c = false , Trigger_Survey__c = true, Test_Check__c = false, NOT(ISPICKVAL(Origin , &apos;ChatwithVOC&apos;)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>VOCSurvey-Qualtrics-Online</fullName>
        <actions>
            <name>VOCSurvey_Qualtrics_AAG</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>contains</operation>
            <value>Online</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>Internal</value>
        </criteriaItems>
        <description>This Survey is used for 0 Day lookback for QBO</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VOCSurvey-Qualtrics-PTG</fullName>
        <actions>
            <name>Case_Survey_Send_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prevent_Survey_Retrigger</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Survey_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>VOCSurvey_Qualtrics_PTG</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(AND(ISPICKVAL(Type,&apos;Getting Started&apos;) , ISPICKVAL(Area__c,&apos;PCG Onboarding&apos;))), ISPICKVAL(Status,&apos;Closed&apos;), IF((ContactId = null &amp;&amp; SuppliedEmail != null), true ,IF((Send_Email__c = true),true,false)) , (CONTAINS($UserRole.Name, &apos;PTG&apos;)), NOT(CONTAINS($User.Username, &apos;dmigr&apos;)) , Suppress_Survey_Retrigger__c = false , Trigger_Survey__c = true, Test_Check__c = false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>VOCSurvey-Qualtrics-PTG-OnBoarding</fullName>
        <actions>
            <name>Case_Survey_Send_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prevent_Survey_Retrigger</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Survey_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>VOCSurvey_Qualtrics_PTG_Onboarding</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>This is the survey which will be used for Surveying the onboarding of PCG Clients.</description>
        <formula>AND( AND(ISPICKVAL(Type,&apos;Getting Started&apos;) , ISPICKVAL(Area__c,&apos;PCG Onboarding&apos;)), ISPICKVAL(Status,&apos;Closed&apos;),  IF((ContactId = null &amp;&amp; SuppliedEmail != null), true ,IF((Send_Email__c = true),true,false)) ,  (CONTAINS($UserRole.Name, &apos;Renewals Consultant&apos;)),  NOT(CONTAINS($User.Username, &apos;dmigr&apos;)) ,  Suppress_Survey_Retrigger__c = false ,  Trigger_Survey__c = true,  Test_Check__c = false  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>VOC_SetSubStatusToResolved</fullName>
        <actions>
            <name>Update_Sub_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(  ISPICKVAL(Status, &apos;Closed&apos;),  PRIORVALUE(Status) != &apos;Closed&apos;,  NOT(ISPICKVAL(Sub_Status__c,&apos;Auto Closed&apos;))  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - AU %28en_AU%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_AU_en_AU</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - AU (en_AU)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_AU&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - Brazil %28pt_BR%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_Brazil_pt_BR</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - Brazil (pt_BR)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;pt_BR&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - Canada English %28en_CA%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_Canada_English_en_CA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - Canada English (en_CA)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_CA&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - Canada French %28fr_CA%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_Canada_French_fr_CA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - Canada French (fr_CA)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; ,  CONTAINS(Locale_Description__c , &apos;fr_CA&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - France %28fr_FR%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_France_fr_FR</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - France (fr_FR)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;fr_FR&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - India %28en_IN%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_India_en_IN</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - India (en_IN)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_IN&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - ROW %28en_UN%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_ROW_en_UN</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - ROW (en_UN)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_UN&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - ROW HK %28en_HK%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_ROW_HK_en_HK</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - ROW HK (en_HK)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_HK&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - ROW MY %28en_MY%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_ROW_MY_en_MY</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - ROW MY (en_MY)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_MY&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - ROW SG %28en_SG%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_ROW_SG_en_SG</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - ROW SG (en_SG)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_SG&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>eCase Auto-Reply Responses - UK %28en_GB%29</fullName>
        <actions>
            <name>eCase_Auto_Reply_Responses_UK_en_GB</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>eCase Auto-Reply Responses - UK (en_GB)</description>
        <formula>AND(CreatedBy.Profile.Name = &apos;API Only&apos; , CONTAINS(Locale_Description__c , &apos;en_GB&apos;), ISPICKVAL(Status , &apos;Open&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>tNPS Care Survey</fullName>
        <actions>
            <name>Send_Care_tNPS_Survey</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>tNPS Survey for Care Agents. One Mail is sent once in 30 Days for a Closed Case</description>
        <formula>IsClosed &amp;&amp; Owner:User.Nps_Last_emailsent__c ==TODAY()   &amp;&amp; $User.Send_Email__c == true  &amp;&amp;  Owner:User.Email != null &amp;&amp; $User.Alias &lt;&gt; &apos;dmigr&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>tNPS Survey</fullName>
        <actions>
            <name>tNPS_Survey</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>tNPS Survey for Agents. One Mail is sent once in 30 Days for a Closed Case</description>
        <formula>IsClosed &amp;&amp; Owner:User.Nps_Last_emailsent__c ==TODAY()   &amp;&amp; $User.Send_Email__c == true  &amp;&amp;  Owner:User.Email != null &amp;&amp; $User.Alias &lt;&gt; &apos;dmigr&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Case_Follow_up</fullName>
        <assignedTo>Customer Success Manager</assignedTo>
        <assignedToType>accountTeam</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Case Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Email_Alert_on_Case_Creation_Sent</fullName>
        <assignedToType>creator</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Case.CreatedDate</offsetFromField>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Email Alert on Case Creation - Sent</subject>
    </tasks>
</Workflow>
