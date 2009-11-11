/******************************************************************************************/
//Name          : TestTwilioRestResponse
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for TwilioRestResponse

/******************************************************************************************/
public class TestTwilioRestResponse{
    @isTest
    public static void TestTwilioRestResponse(){
        String xmlData = '<TwilioResponse><Recordings page=\"0\" numpages=\"1\" pagesize=\"50\" total=\"16\" start=\"0\" end=\"15\"><Recording><Sid>RE41331862605f3d662488fdafda2e175f</Sid>';
        xmlData = xmlData + '<AccountSid>AC309475e5fede1b49e100272a8640f438</AccountSid><CallSid>CAcd420fcb3c4b86e360ea0cc27ebc8698</CallSid><Duration>123</Duration><DateCreated>Tue, 01 Apr 2008 01:07:15 -0400</DateCreated><DateUpdated>Tue, 01 Apr 2008 01:07:15 -0400</DateUpdated>';
        xmlData = xmlData + '</Recording><Recording><Sid>RE50358f2565ad3c542e004161c3aecfd2</Sid><AccountSid>AC309475e5fede1b49e100272a8640f438</AccountSid><CallSid>CAcd420fcb3c4b86e360ea0cc27ebc8698</CallSid>';
        xmlData = xmlData + '<Duration>45</Duration><DateCreated>Tue, 01 Apr 2008 01:07:10 -0400</DateCreated><DateUpdated>Tue, 01 Apr 2008 01:07:10 -0400</DateUpdated></Recording>';
        xmlData = xmlData + '</Recordings></TwilioResponse>';
        TwilioRestResponse response = new TwilioRestResponse('https://api.twilio.com/2008-08-01/Accounts',xmlData,200);
        response.getResponseText();
        response.getHttpStatus();
        response.getUrl();
        response.getQueryString();
        response.isError();
        response.setResponseText('test');
        response.setHttpStatus(400);
        response.setUrl('test');
        response.setQueryString('test');
        response.setError(false);
    }
}