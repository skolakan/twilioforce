/******************************************************************************************/
//Name          : TestNotificationsXmlParser
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for CallsXmlParser

/******************************************************************************************/
public class TestNotificationsXmlParser{
    @isTest
    public static void TestNotificationsXmlParserMethod1(){
        NotificationsXmlParser callxml = new NotificationsXmlParser();
        String xmlData = '<TwilioResponse><Notifications page=\"0\" numpages=\"10\" pagesize=\"50\" total=\"498\" start=\"0\" end=\"49\"><Notification><Sid>NO1fb7086ceb85caed2265f17d7bf7981c</Sid><DateCreated>Sat, 07 Feb 2009 13:15:19 -0800</DateCreated><DateUpdated>Sat, 07 Feb 2009 13:15:19 -0800</DateUpdated>';
        xmlData = xmlData + '<AccountSid>AC309475e5fede1b49e100272a8640f438</AccountSid><CallSid>CA42ed11f93dc08b952027ffbc406d0868</CallSid><Log>0</Log><ErrorCode>12345</ErrorCode><MoreInfo>http://www.twilio.com/docs/errors/12345</MoreInfo><RequestURL>http://yourserver.com/handleCall.php</RequestURL>';
        xmlData = xmlData + '<RequestMethod>POST</RequestMethod><MessageText>Unable to parse XML response</MessageText><MessageDate>Thu, 03 Apr 2008 04:36:32 -0400</MessageDate></Notification><Notification><Sid>NOe936fdac57d238e56fd346b89820d342</Sid><DateCreated>Sat, 07 Feb 2009 13:15:19 -0800</DateCreated><DateUpdated>Sat, 07 Feb 2009 13:15:19 -0800</DateUpdated><AccountSid>AC309475e5fede1b49e100272a8640f438</AccountSid>';
        xmlData = xmlData + '<CallSid></CallSid><Log>1</Log><ErrorCode>67890</ErrorCode><MoreInfo>http://www.twilio.com/docs/errors/67890</MoreInfo><RequestURL>http://api.twilio.com/2008-08-01/Accounts/AC309475e5fede1b49e100272a8640f438/Calls</RequestURL>';
        xmlData = xmlData + '<RequestMethod>POST</RequestMethod><MessageText>Unknown parameter received by the REST API: foo=bar</MessageText>';
        xmlData = xmlData + '<MessageDate>Thu, 03 Apr 2008 04:36:32 -0400</MessageDate></Notification></Notifications></TwilioResponse> ';
        NotificationsXmlParser callxml1 = new NotificationsXmlParser(xmlData);
    }
}