/******************************************************************************************/
//Author        :
//Date          :
//Description   : Container class stores the error or xml response 
//Name          : TwilioRestResponse 
/******************************************************************************************/


/**  
 * TwilioRestResponse holds all the REST response data 
 *         Before using the reponse, check IsError to see if an exception occurred with the data sent to Twilio
 *         ResponseXml will contain a SimpleXml object with the response xml
 *         ResponseText contains the raw string response
 *         Url and QueryString are from the request
 *         HttpStatus is the response code of the request
 */
public class TwilioRestResponse {

    private String responseText;
    private integer httpStatus;
    private String url;
    private String queryString;
    private boolean error;
    
    
    public TwilioRestResponse(String url, String text, integer status){
        Pattern p = Pattern.compile('([^?]+)\\??(.*)');
        Matcher m = p.matcher(url);
        m.matches();
        this.url = m.group(1);
        this.queryString = m.group(2);
        this.responseText = text;
        this.httpStatus=status;
        this.error = (status>=400);  
    }
    
    // getters and setters 
    public String getResponseText() {
        return responseText;
    }
    public void setResponseText(String responseText) {
        this.responseText = responseText;
    }
    public integer getHttpStatus() {
        return httpStatus;
    }
    public void setHttpStatus(integer httpStatus) {
        this.httpStatus = httpStatus;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getQueryString() {
        return queryString;
    }
    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }
    public boolean isError() {
        return error;
    }
    public void setError(boolean error) {
        this.error = error;
    }   
}