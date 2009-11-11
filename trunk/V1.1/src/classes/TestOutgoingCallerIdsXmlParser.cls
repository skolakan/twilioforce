/******************************************************************************************/
//Name          : TestOutgoingCallerIdsXmlParser
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for OutgoingCallerIdsXmlParser

/******************************************************************************************/
public class TestOutgoingCallerIdsXmlParser{
    @isTest
    public static void TestOutgoingCallerIdsXmlParserMethod1(){
        OutgoingCallerIdsXmlParser callxml = new OutgoingCallerIdsXmlParser();
        String xmlData = '<TwilioResponse><OutgoingCallerIds page=\"0\" numpages=\"1\" pagesize=\"50\" total=\"2\" start=\"0\" end=\"0\"><OutgoingCallerId><Sid>PNe536dfda7c6184afab78d980cb8cdf43</Sid> ';
        xmlData = xmlData + '<AccountSid>AC35542fc30a091bed0c1ed511e1d9935d</AccountSid><FriendlyName>Bob Cell Phone</FriendlyName><PhoneNumber>4158675309</PhoneNumber><DateCreated>Tue, 01 Apr 2008 11:26:32 -0700</DateCreated><DateUpdated>Tue, 01 Apr 2008 11:26:32 -0700</DateUpdated> ';
        xmlData = xmlData + '</OutgoingCallerId><OutgoingCallerId><Sid>PNe536dfda7c6DDd455fed980cb83345FF</Sid><AccountSid>AC35542fc30a091bed0c1ed511e1d9935d</AccountSid><FriendlyName>Company Main Line</FriendlyName> ';
        xmlData = xmlData + '<PhoneNumber>4158675310</PhoneNumber> <DateCreated>Tue, 01 Apr 2008 11:26:32 -0700</DateCreated> ';
        xmlData = xmlData + '<DateUpdated>Tue, 01 Apr 2008 11:26:32 -0700</DateUpdated> </OutgoingCallerId> ';
        xmlData = xmlData + '</OutgoingCallerIds>  </TwilioResponse>   ';
        OutgoingCallerIdsXmlParser callxml1 = new OutgoingCallerIdsXmlParser(xmlData);
    }
}