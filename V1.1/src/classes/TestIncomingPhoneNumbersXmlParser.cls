/******************************************************************************************/
//Name          : TestIncomingPhoneNumbersXmlParser
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for IncomingPhoneNumbersXmlParser

/******************************************************************************************/
public class TestIncomingPhoneNumbersXmlParser{
    @isTest
    public static void TestIncomingPhoneNumbersXmlParserMethod1(){
        IncomingPhoneNumbersXmlParser incallxml = new IncomingPhoneNumbersXmlParser();
        String xmlData = '<TwilioResponse><IncomingPhoneNumbers page=\"0\" numpages=\"1\" pagesize=\"50\" total=\"2\" start=\"0\" end=\"0\"> <IncomingPhoneNumber>';
        xmlData = xmlData + '<Sid>PNe536dfda7c6184afab78d980cb8cdf43</Sid> <AccountSid>AC35542fc30a091bed0c1ed511e1d9935d</AccountSid><FriendlyName>Company Main Line</FriendlyName><PhoneNumber>4158675309</PhoneNumber><Url>http://mycompany.com/handleMainLineCall.asp</Url><Method>GET</Method>';
        xmlData = xmlData + '<DateCreated>Tue, 01 Apr 2008 11:26:32 -0700</DateCreated><DateUpdated>Tue, 01 Apr 2008 11:26:32 -0700</DateUpdated></IncomingPhoneNumber><IncomingPhoneNumber><Sid>PNe536dfda7c6DDd455fed980cb83345FF</Sid> ';
        xmlData = xmlData + '<AccountSid>AC35542fc30a091bed0c1ed511e1d9935d</AccountSid><FriendlyName>Company Support Line</FriendlyName><PhoneNumber>4158675310</PhoneNumber><Url>http://mycompany.com/handleSupportCall.php</Url><Method>POST</Method>';
        xmlData = xmlData + '<DateCreated>Tue, 01 Apr 2008 11:26:32 -0700</DateCreated> <DateUpdated>Tue, 01 Apr 2008 11:26:32 -0700</DateUpdated> </IncomingPhoneNumber></IncomingPhoneNumbers></TwilioResponse>';
        
        IncomingPhoneNumbersXmlParser incallxml1 = new IncomingPhoneNumbersXmlParser(xmlData);
    }
}