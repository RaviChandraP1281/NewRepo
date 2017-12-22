public with sharing class ValidateOAuth {    
    
	private ApexPages.StandardController controller {get; set;}
    public String oauthcode {
        get;
        set {
            oauthcode = value;
        }
    }
    
    public String refreshToken {
        get;
        set {
            refreshToken = value;            
        }
    }
    
    public String instanceURL {
        get;
        set {
            instanceURL = value;
        }
    }
    
    public String sfOrgID {
        get;
        set {
            sfOrgID = value;
        }
    }
    public String stateData {
        get;
        set {
            stateData = value;
        }
    }
    
   public String successMessage {
        get;
        set {
            successMessage = value;
        }
    }   

    // initialize the controller
    public ValidateOAuth(ApexPages.StandardController controller) {
        this.controller = controller;        
    }
    
    
    public ValidateOAuth(){
        
    }
    
    public PageReference onLoadCode(){
        String stateStr = ApexPages.currentPage().getParameters().get('state');
        if(stateStr != null && stateStr != ''){
            successMessage = 'Your salesforce org will be registered. ';
        	String[] userArr = stateStr.split('\\|');
            String orgTitle = '';
            String userName = '';
            String idSfOrg = '';
            if(userArr != null && userArr.size() > 0){
                orgTitle = userArr[0];
                userName = userArr[1];  
                idSfOrg = userArr[2];  
            }
            successMessage += '		Org Title : '+orgTitle;
            successMessage += '  	User Name: '+ userName;
        }
        return null;
    }

    public PageReference redirect(){
        
        String serviceURL = 'https://login.salesforce.com/services/oauth2/token';
        Http h = new Http();     
        System.debug('code:'+oauthcode);
        String reqBody = 'grant_type=authorization_code'
            +'&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g&client_secret=6452851928561691716'
            +'&redirect_uri=https://arvaultdev-developer-edition.na59.force.com/apex/testOAuthVfp'
            +'&code='+oauthcode;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setBody(reqBody);
        req.setMethod('POST');
		req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        HttpResponse res = h.send(req);
        System.debug('res.body:'+res.getBody());
        Map<String, Object> s1 = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        System.debug('s1:'+s1);
        if(s1 != null && s1.size() > 0){
            refreshToken = (String) s1.get('refresh_token');
            instanceURL = (String) s1.get('instance_url');
        }
        System.debug('refreshToken:'+refreshToken+':instanceURL:'+instanceURL);
        System.debug('stateData:'+stateData);
        String[] userArr = stateData.split('\\|');
        String orgTitle = '';
        String userName = '';
        String idSfOrg = '';
        if(userArr != null && userArr.size() > 0){
        	orgTitle = userArr[0];
        	userName = userArr[1];  
            idSfOrg = userArr[2];  
        }
        System.debug('orgTitle:'+orgTitle+'userName:'+userName);
        String retStr = '';
        if(idSfOrg != 'undefined' && idSfOrg != '' ){
            retStr = new ValidateOAuth().updateSfOrg(idSfOrg, orgTitle, userName,'', '', 'oauth','f939bec89dc549d9bb2a5ef164ac0eb5', refreshToken, instanceURL);
            if(retStr == 'true'){
            	sfOrgID =  idSfOrg;
            }            
        }else{
            retStr = new ValidateOAuth().basicAuthCallout(orgTitle, userName, '', '', 'oauth', 'f939bec89dc549d9bb2a5ef164ac0eb5', refreshToken, instanceURL);
            sfOrgID = retStr;
        }
        if(sfOrgID != ''){
            successMessage = 'Org has been successfully registered with ARVault';
        }else{
            successMessage = 'InvalidOrg, Please verify your credentials.';
        }
		System.debug('retStr:'+retStr);
        return null;
   }
    
    public String baseURL = 'http://54.202.231.145:8080/ARVault';    
    
    public String basicAuthCallout(String orgName, String userName, String pwd, String sfSecToken, String sfAuthType,
                                          			String idUser, String refreshToken, String instanceURL){
 
       System.debug(''+orgName+', '+userName+', '+pwd+', '+sfSecToken+','+idUser);
     String userInfo = '{"nmLable":"'+orgName
         +'", "sfNmUser":"'+userName
         +'","sfTxPwd":"'+pwd
         +'","sfSecToken":"'+sfSecToken
         +'","sfAuthType":"'+sfAuthType
         +'", "idUser":"'+idUser
         +'", "sfAccessToken":"'
         +'", "sfRefreshToken":"'+refreshToken
         +'", "sfInstanceUrl":"'+instanceURL
         +'"}';
	 String serviceURL = baseURL + '/addSforgEnvi';
    
     Map<String, Object> responseList = generateResponse(serviceURL, userInfo);
     String responseStr = (String) responseList.get('idSforg');  
       System.debug(''+responseStr);
     return responseStr;  
   }
    

    public String updateSfOrg(String idSforg, String nmLable, String sfNmUser,String sfTxPwd, String sfSecToken, 
                                     String sfAuthType, String idUser, String refreshToken, String instanceURL){
			String userInfo = '{"idSforg":"'+idSforg
                +'","nmLable":"'+nmLable
                +'", "sfNmUser": "'+sfNmUser
                +'","sfTxPwd":"'+sfTxPwd
                +'","sfSecToken":"' +sfSecToken
                +'","sfAuthType":"'+sfAuthType
                +'", "idUser": "'+idUser
                +'", "sfAccessToken":"'+
                +'", "sfRefreshToken":"'+refreshToken
                +'", "sfInstanceUrl":"'+instanceURL         
                +'"}';
			String serviceURL = baseURL + '/updateSforgEnvi';
            String responseList = generateResponseStr(serviceURL, userInfo);
            System.debug(''+responseList);
            return responseList;  
     }                                         
    
     public Map<String, Object> generateResponse(String serviceURL, String jsonInput){
    	HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        
        // Specify the required user name and password to access the endpoint with header info
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        
            if(res.getStatusCode() == 200 && res.getBody() != null && res.getBody() != ''){
                
                system.debug('Authentication success!!!' + res);
                System.debug(res.getBody());
                responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                         
            }else{
                
                system.debug('Authentication failed!!!' + res + res.getStatusCode());
               //responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                               	
            }
	            
        
        return responseObjects;
    }
    
     public String generateResponseStr(String serviceURL, String jsonInput){
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
		//req.setBodyAsBlob()
     
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseObjects = '';
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects =(String)res.getBody();                      
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (String)res.getBody();                               	
        }
        return responseObjects;
    }  
}