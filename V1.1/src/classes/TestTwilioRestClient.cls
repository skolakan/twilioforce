/******************************************************************************************/
//Name          : TestTwilioRestClient
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for TwilioRestClient

/******************************************************************************************/
public class TestTwilioRestClient{
    @isTest
    public static void TestTwilioRestClientMethod1(){
        TwilioRestClient twrClient= new TwilioRestClient('AC892167ae706a8243478f802445ef5bab','fa7e3c6af8c07fe8f06988fcb3dd3949','https://api.twilio.com');
        Map<String, String> vars = new Map<String, String>();
        vars.put('Test','Test');
        twrClient.request('AC892167ae706a8243478f802445ef5bab','POST',vars);
        twrClient.request('AC892167ae706a8243478f802445ef5bab','GET',vars);
    }
}