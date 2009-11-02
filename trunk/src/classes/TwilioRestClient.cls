/******************************************************************************************/
//Author        :
//Date          :
//Description   : Main class for Twilio Rest API Calls
//Name          : TwilioRestClient 
/******************************************************************************************/


public class TwilioRestClient {
    
    private String endpoint = 'https://api.twilio.com';
    private String accountSid;
    private String authToken;
    

    public TwilioRestClient(String accountSid, String authToken, String endpoint) {

        this.accountSid = accountSid;
        this.authToken = authToken;
        if((endpoint!=null)&&(!endpoint.equals(''))){
            this.endpoint = endpoint;
        }
    }
    
    
    
    /*
     * sendRequst
     *   Sends a REST Request to the Twilio REST API
     *   $path : the URL (relative to the endpoint URL, after the /v1)
     *   $method : the HTTP method to use, defaults to GET
     *   $vars : for POST or PUT, a key/value associative array of data to send, for GET will be appended to the URL as query params
     */
    public TwilioRestResponse request(String path, String method , Map<String,String> vars) {

        String encoded = '';
        if(vars!=null){
            for(String key: vars.keySet()){
                try {
                    encoded += '&'+key+'='+ EncodingUtil.urlEncode(vars.get(key),'UTF-8');
                } catch (Exception e) {
                    system.debug('ERROR:' +  e);
                }
            }
            encoded =encoded.substring(1);
        }
        
        // construct full url
        String url = this.endpoint+path;
        
        // if GET and vars, append them
        if(method.toUpperCase().equals('GET')) 
            url+= ((path.indexOf('?')==-1)?'?':'&')+encoded;
            
            
        try {
            HttpRequest con = new HttpRequest();
            con.setEndPoint(url);
            String userpass = this.accountSid+':'+this.authToken;
            
            Blob headerValue = Blob.valueOf(userpass);
            String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
            con.setHeader('Authorization', authorizationHeader);
    
            // initialize a new curl object            
            if(method.toUpperCase().equals('GET')){
                con.setMethod('GET');
            } /*else if(method.toUpperCase().equals("POST")){
                con.setRequestMethod("POST");
                OutputStreamWriter out = new OutputStreamWriter(
                        con.getOutputStream());
                out.write(encoded);
                out.close();
            } else if(method.toUpperCase().equals("PUT")){
                con.setRequestMethod("PUT");
                OutputStreamWriter out = new OutputStreamWriter(
                        con.getOutputStream());
                out.write(encoded);
                out.close();
            } else if(method.toUpperCase().equals("DELETE")){
                con.setRequestMethod("DELETE");
            } */else {
                    //throw new Exception('Unknown method '+method);
                    return null;
            }
            
            Http http = new Http();
            HTTPResponse res = http.send(con);
            string decodedString = res.getBody();
            System.debug(decodedString);
            if(decodedString==null) {
                system.debug('ERROR: Unable to read response from server');
                return null;
            } 
            
        
            
            // get result code
            integer responseCode = res.getStatusCode();
                
            return new TwilioRestResponse(url, decodedString, responseCode);
        } catch (Exception e) {
                system.debug('ERROR:' +  e);
                return null;
          }
              
        
        return null;
    } 

    public String getAccountSid() {
        return accountSid;
    }

    public void setAccountSid(String accountSid) {
        this.accountSid = accountSid;
    }
    
    
    
}