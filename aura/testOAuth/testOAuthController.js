({
	doInit  : function(component, event, helper) {
        debugger;
        alert('href:'+window.location.href);
        var loc = window.location.href.replace("#", "?");
        var sPageURL = loc.split('?')[1];
        var sURLVariables = sPageURL.split('&');
        var code, refreshToken;
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('='); //to split the key from the value.
		    if (sParameterName[0] === 'code') { 
               code =  sParameterName[1];                
            }
            /*if (sParameterName[0] === 'code') { 
               code =  sParameterName[1];                
            }*/
        }
        //window.close();
        //if(code != ''){
            //var url = "https://login.salesforce.com/services/oauth2/authorize?grant_type=authorization_code&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g&client_secret=&redirect_uri=https://arvault-dev-ed.lightning.force.com/c/testOAuth.app&code="+code;
           // var url = "https://arvault-dev-ed.lightning.force.com/one/one.app#/n/Setup?code="+code;
            //window.location = url; 
        	
        /*}else{
            
        }*/
        
        
	}
})