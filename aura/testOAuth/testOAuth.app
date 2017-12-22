<!--aura:application >
    <aura:attribute name="refresh_token" type="String"/>
    <aura:attribute name="code" type="String"/>
    
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/> 
    Code is : {!v.code} 
    
    <c:testSfOAuth />
</aura:application -->
<aura:application > <!--access="GLOBAL" extends="ltng:outApp">-->
    <!--aura:dependency resource="c:MyAuraLgtComponent"/-->
    <aura:attribute name="refresh_token" type="String"/>
    <aura:attribute name="code" type="String"/>
    
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/> 
    Code is : {!v.code} 
    
</aura:application>