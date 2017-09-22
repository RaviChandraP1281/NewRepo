public class APICallOuts {  
    
    public static void basicAuthCallout(){
     String userInfo = '{"nmLable":"JJOrg", "sfNmUser":"jayashree.j@autorabit.com","sfTxPwd":"Naresh@7aoB6LTfrRk6OzQYx6JRuDU0Oz"}';
	 String baseURL = 'http://54.202.231.145:8080/ARVault/addSforgEnvi';
    
     HttpRequest req = new HttpRequest();
     req.setEndpoint(baseURL);
     req.setMethod('POST');
     
     // Specify the required user name and password to access the endpoint
     // As well as the header and header information
 
     String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
     String password = 'Naresh@7';
  
     Blob headerValue = Blob.valueOf(username + ':' + password);
     String authorizationHeader = 'Basic ' +
     EncodingUtil.base64Encode(headerValue);
     req.setHeader('Authorization', authorizationHeader);
     req.setHeader('Content-type', 'application/json');
   	 req.setBody(userInfo);

     // Create a new http object to send the request object
     // A response object is generated as a result of the request  
  
     Http http = new Http();
     HTTPResponse res = http.send(req);
     System.debug(res.getBody());
   }    
    public static void addSfObjects(){
     String sfOrgId = '{"sfOrgId": "00D6F000001OOISUA4"}';
	 String baseURL = 'http://54.202.231.145:8080/ARVault/getSfObjects';
    
     HttpRequest req = new HttpRequest();
     req.setEndpoint(baseURL);
     req.setMethod('POST');
     
     // Specify the required user name and password to access the endpoint
     // As well as the header and header information
 
     String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
     String password = 'Naresh@7';
  
     Blob headerValue = Blob.valueOf(username + ':' + password);
     String authorizationHeader = 'Basic ' +
     EncodingUtil.base64Encode(headerValue);
     req.setHeader('Authorization', authorizationHeader);
     req.setHeader('Content-type', 'application/json');
   	 req.setBody(sfOrgId);

     // Create a new http object to send the request object
     // A response object is generated as a result of the request  
  
     Http http = new Http();
     HTTPResponse res = http.send(req);
     System.debug(res.getBody());
        
    }
    public static void getAs(){
      /*  String url = 'https://th-yelp-locator.herokuapp.com/search?address=' + lat +','+ lon + '&term=' 
            + EncodingUtil.urlEncode(searchTerm, 'UTF-8');
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('POST');    
        req.setEndpoint(url);
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());  */
        
       /* HttpRequest req = new HttpRequest();
		Http http = new Http();

         String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
         String password = 'Naresh@7';
  
    	 Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        req.setMethod('POST');
        req.setBody('{"sfOrgId": "00D6F000001OOISUA4"}');

        String url ='http://54.202.231.145:8080/ARVault/getSfObjects';
        req.setEndPoint(url);
        HTTPResponse resp = http.send(req);  */
        
        String url ='http://54.202.231.145:8080/ARVault/getSfObjects';
              String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
         String password = 'Naresh@7';
     			   HttpRequest req = new HttpRequest();
                req.setEndpoint(url);
                req.setMethod('POST');
         Blob headerValue = Blob.valueOf(username + ':' + password);
              String authorizationHeader = 'BASIC ' +
          		  EncodingUtil.base64Encode(headerValue);
          		  req.setHeader('Authorization', authorizationHeader);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody(''
                        + 'sfOrgId=' + EncodingUtil.urlEncode('00D6F000001OOISUA4', 'UTF-8')
                        );
                
                HttpResponse res = new Http().send(req);
                if (res.getStatusCode() == 200) {
                    System.debug('Got it............'); 
                } else {
                     System.debug('Error.........'); 
                    // Handle errors or redirects
                }

        
    }
}