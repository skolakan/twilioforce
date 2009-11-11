/******************************************************************************************/
//Name          : TestTwilioRestExample
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for TwilioRestExample

/******************************************************************************************/
public class TestTwilioRestExample{
    @isTest
    public static void TestOutgoingCallerIdsXmlParserMethod1(){
        /* Twilio AccountSid and AuthToken */
		String AccountSid = 'acctSID here';
		String AuthToken = 'authToken here';
		
		/* Outgoing Caller ID previously validated with Twilio */
		String CallerID = 'NNNNNNNNNN';
		
		/* Instantiate a new Twilio Rest Client */
		TwilioRestClient client = new TwilioRestClient(AccountSid, AuthToken, null);
	    TwilioRestExample.getOutgoingCallerIdsExample(client);
	    TwilioRestExample.getAccountsExample(client);
	    TwilioRestExample.getIncomingPhoneNumbersExample(client);
	    TwilioRestExample.getNotificationsExample(client);
	    TwilioRestExample.getTranscriptionsExample(client);
	    TwilioRestExample.getRecordingsExample( client, 'CA123456789012345678901234567890AF');
	}
}