/******************************************************************************************/
//Name          : TestAccountsXmlParser
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for AccountsXmlParser

/******************************************************************************************/
public class TestAccountsXmlParser{
    @isTest
    public static void TestAccountsXmlParserMethod1(){
        AccountsXmlParser acxml = new AccountsXmlParser();
        String xmlData = '<TwilioResponse> <Account> <Sid>AC309475e5fede1b49e100272a8640f438</Sid> <FriendlyName>My Nice Twilio Account</FriendlyName> <Status>2</Status> <StatusText>Active</StatusText>';
        xmlData = xmlData + '<DateCreated>Wed, 02 Apr 2008 17:33:38 -0700</DateCreated><DateUpdated>Wed, 02 Apr 2008 17:34:18 -0700</DateUpdated> <AuthToken>3a2630a909aadbf60266234756fb15a0</AuthToken> </Account></TwilioResponse>';
        AccountsXmlParser acxml1 = new AccountsXmlParser(xmlData);
    }
}