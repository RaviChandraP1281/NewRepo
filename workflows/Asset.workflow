<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Action_Date_update</fullName>
        <field>Action_Date__c</field>
        <formula>IF(ISNULL(Suspend_Date__c) &amp;&amp; ISNULL(Cancel_Date__c) &amp;&amp; !ISNULL(First_Charge_Date__c), null,
IF(!ISBLANK(Text(Status)) &amp;&amp; !ISNULL(Online_Expiry_Date__c) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;, Online_Expiry_Date__c +90,
IF((!ISNULL(Cancel_Date__c)&amp;&amp;ISNULL(Payment_Setup_Date__c)&amp;&amp;ISNULL(Suspend_Date__c)&amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;),Cancel_Date__c+30,
IF((!ISNULL(Cancel_Date__c)&amp;&amp; !ISNULL(Payment_Setup_Date__c)&amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;),Cancel_Date__c+90,
IF((!ISNULL(Suspend_Date__c) &amp;&amp; !ISNULL(Payment_Setup_Date__c) &amp;&amp; ISNULL(Cancel_Date__c) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;),Suspend_Date__c+90,null)))))</formula>
        <name>Action Date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Day90_Full_Support_Date</fullName>
        <field>Full_Support_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 90)</formula>
        <name>90 Day Full Support Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Denormalize_Last_Updated_Date</fullName>
        <field>Siebel_Last_Updated_Date_Text__c</field>
        <formula>TEXT(DAY(DATEVALUE(Siebel_Last_Updated_Date__c)))
+&quot;-&quot;+
CASE(TEXT(MONTH(DATEVALUE(Siebel_Last_Updated_Date__c))),
&quot;1&quot;, &quot;Jan&quot;,
&quot;2&quot;, &quot;Feb&quot;,
&quot;3&quot;, &quot;Mar&quot;,
&quot;4&quot;, &quot;Apr&quot;,
&quot;5&quot;, &quot;May&quot;,
&quot;6&quot;, &quot;Jun&quot;,
&quot;7&quot;, &quot;Jul&quot;,
&quot;8&quot;, &quot;Aug&quot;,
&quot;9&quot;, &quot;Sep&quot;,
&quot;10&quot;, &quot;Oct&quot;,
&quot;11&quot;, &quot;Nov&quot;,
&quot;12&quot;, &quot;Dec&quot;,
null)
+&quot;-&quot;+
TEXT(YEAR(DATEVALUE(Siebel_Last_Updated_Date__c)))</formula>
        <name>Denormalize Last Updated Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Denormalize_Next_Bill_Date</fullName>
        <description>Denormalize Next Bill Date for Asset Search</description>
        <field>Siebel_Next_Bill_Date_Text__c</field>
        <formula>TEXT(DAY(DATEVALUE( Siebel_Next_Bill_Date__c ))) 
+&quot;-&quot;+ 
CASE(TEXT(MONTH(DATEVALUE(Siebel_Next_Bill_Date__c))), 
&quot;1&quot;, &quot;Jan&quot;,
&quot;2&quot;, &quot;Feb&quot;,
&quot;3&quot;, &quot;Mar&quot;,
&quot;4&quot;, &quot;Apr&quot;,
&quot;5&quot;, &quot;May&quot;,
&quot;6&quot;, &quot;Jun&quot;,
&quot;7&quot;, &quot;Jul&quot;,
&quot;8&quot;, &quot;Aug&quot;,
&quot;9&quot;, &quot;Sep&quot;,
&quot;10&quot;, &quot;Oct&quot;,
&quot;11&quot;, &quot;Nov&quot;,
&quot;12&quot;, &quot;Dec&quot;,
null) 
+&quot;-&quot;+ 
TEXT(YEAR(DATEVALUE(Siebel_Next_Bill_Date__c)))</formula>
        <name>Denormalize Next Bill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Denormalize_Payment_Method</fullName>
        <field>Siebel_Payment_Method_Text__c</field>
        <formula>IF( AND(Siebel_Credit_Card_Type__c != null, Siebel_Credit_Card_Num_Masked__c != null), 
Siebel_Credit_Card_Type__c + &apos; &apos; + RIGHT(Siebel_Credit_Card_Num_Masked__c, 4), 
IF(Siebel_EFT_Bank_Account_Type__c != null, 
Siebel_EFT_Bank_Account_Type__c, null))</formula>
        <name>Denormalize Payment Method</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Denormalize_Service_Start_Date</fullName>
        <description>Denormalize Siebel Service Start Date for Asset Search</description>
        <field>Siebel_Service_Start_Date_Text__c</field>
        <formula>TEXT(DAY(DATEVALUE( Siebel_Service_Start_Date__c ))) 
+&quot;-&quot;+ 
CASE(TEXT(MONTH(DATEVALUE(Siebel_Service_Start_Date__c))), 
&quot;1&quot;, &quot;Jan&quot;,
&quot;2&quot;, &quot;Feb&quot;,
&quot;3&quot;, &quot;Mar&quot;,
&quot;4&quot;, &quot;Apr&quot;,
&quot;5&quot;, &quot;May&quot;,
&quot;6&quot;, &quot;Jun&quot;,
&quot;7&quot;, &quot;Jul&quot;,
&quot;8&quot;, &quot;Aug&quot;,
&quot;9&quot;, &quot;Sep&quot;,
&quot;10&quot;, &quot;Oct&quot;,
&quot;11&quot;, &quot;Nov&quot;,
&quot;12&quot;, &quot;Dec&quot;,
null) 
+&quot;-&quot;+ 
TEXT(YEAR(DATEVALUE(Siebel_Service_Start_Date__c)))</formula>
        <name>Denormalize Service Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Denormalize_Suspended_Date</fullName>
        <description>Denormalize Suspended Date for Asset Search</description>
        <field>Siebel_Suspended_Date_Text__c</field>
        <formula>TEXT(DAY(DATEVALUE(  Siebel_Suspended_Date__c  ))) 
+&quot;-&quot;+ 
CASE(TEXT(MONTH(DATEVALUE( Siebel_Suspended_Date__c ))), 
&quot;1&quot;, &quot;Jan&quot;,
&quot;2&quot;, &quot;Feb&quot;,
&quot;3&quot;, &quot;Mar&quot;,
&quot;4&quot;, &quot;Apr&quot;,
&quot;5&quot;, &quot;May&quot;,
&quot;6&quot;, &quot;Jun&quot;,
&quot;7&quot;, &quot;Jul&quot;,
&quot;8&quot;, &quot;Aug&quot;,
&quot;9&quot;, &quot;Sep&quot;,
&quot;10&quot;, &quot;Oct&quot;,
&quot;11&quot;, &quot;Nov&quot;,
&quot;12&quot;, &quot;Dec&quot;,
null) 
+&quot;-&quot;+ 
TEXT(YEAR(DATEVALUE( Siebel_Suspended_Date__c )))</formula>
        <name>Denormalize Suspended Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_CCP_30DaySupport</fullName>
        <field>CCP_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 365)</formula>
        <name>PCS_CCP_30DaySupport</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_CCP_End_Date_Update</fullName>
        <field>CCP_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 365)</formula>
        <name>PCS CCP End Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_CCP_SetupSupport</fullName>
        <field>CCP_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 365)</formula>
        <name>PCS_CCP_SetupSupport</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_Full_1YearSupportPlan</fullName>
        <field>Full_Support_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 365)</formula>
        <name>PCS Full 1YearSupportPlan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_Full_30DaySupportCCP</fullName>
        <field>Full_Support_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Activation_Date__c)+ 30)</formula>
        <name>PCS Full 30DaySupportCCP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCS_Full_3YearSupportPlan</fullName>
        <field>Full_Support_End_Date__c</field>
        <formula>DateTimeValue(DateValue(Siebel_Registration_Date__c)+ 1095)</formula>
        <name>PCS_Full_3YearSupportPlan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X90_Day_Retail_CCP</fullName>
        <description>ccp end date for retail</description>
        <field>CCP_End_Date__c</field>
        <formula>DateTimeValue(DateValue( Siebel_Registration_Date__c )+ 365)</formula>
        <name>90 Day Retail - CCP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Action Date update</fullName>
        <actions>
            <name>Action_Date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>(!ISNULL(Cancel_Date__c) &amp;&amp; ISNULL( Payment_Setup_Date__c ) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;)  ||(!ISNULL(Cancel_Date__c) &amp;&amp; !ISNULL( Payment_Setup_Date__c ) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;)  ||(!ISNULL(Suspend_Date__c) &amp;&amp; !ISNULL(Payment_Setup_Date__c) &amp;&amp; ISNULL(Cancel_Date__c) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;)  ||(ISNULL(Suspend_Date__c) &amp;&amp; ISNULL(Cancel_Date__c))  ||(ISBLANK(Cancel_Date__c) &amp;&amp; ISBLANK(Suspend_Date__c)) ||(!ISBLANK(Text(Status)) &amp;&amp;   ISPICKVAL(Status ,&apos;Expired Trial&apos;) &amp;&amp; !ISBLANK( Online_Expiry_Date__c ) &amp;&amp; Online_Current_Product_SKU__c != &apos;9999&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Denormlize Data for Asset Search</fullName>
        <actions>
            <name>Denormalize_Last_Updated_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Denormalize_Next_Bill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Denormalize_Payment_Method</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Denormalize_Service_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Denormalize_Suspended_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Asset.CreatedById</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <description>Denormlize Data for Asset Search Page</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_1YearSupportPlan</fullName>
        <actions>
            <name>PCS_Full_1YearSupportPlan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>1 Year Support Plan</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_30DaySupportCCP</fullName>
        <actions>
            <name>PCS_CCP_30DaySupport</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PCS_Full_30DaySupportCCP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>30 Day Support Plan + CCP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_3YearSupportPlan</fullName>
        <actions>
            <name>PCS_Full_3YearSupportPlan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Siebel_Price_Type__c</field>
            <operation>equals</operation>
            <value>One-Time</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>3 Year Support Plan</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_90_Day_Support</fullName>
        <actions>
            <name>Day90_Full_Support_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>X90_Day_Retail_CCP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Siebel_Price_Type__c</field>
            <operation>equals</operation>
            <value>One-Time</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>90 Day Support Plan + CCP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_CCP</fullName>
        <actions>
            <name>PCS_CCP_End_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Siebel_Price_Type__c</field>
            <operation>equals</operation>
            <value>One-Time</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>CCP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PCS_SetupSupportCCP</fullName>
        <actions>
            <name>PCS_CCP_SetupSupport</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Support_Category__c</field>
            <operation>equals</operation>
            <value>Setup Support Plan + CCP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
