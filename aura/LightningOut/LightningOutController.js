({
    redirect : function(component, event, helper) {
        window.location.href = 'https://login.salesforce.com/services/oauth2/authorize?response_type=token&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g&redirect_uri=https://arvault-dev-ed.lightning.force.com/c/testOAuth.app&prompt=login&display=popup';
        //'https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=[YOUR CLIENT ID]&redirect_uri=[REDIRECT URL]&prompt=login&display=popup';        
        
    },
    getCons : function(component, event, helper) {
        document.getElementById("tblDiv").style.display = "block";
        var code = component.get("v.code");        
        //helper.getContacts(component, code);
    }
})