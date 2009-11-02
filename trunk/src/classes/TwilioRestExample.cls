/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : The code examples how to user Apex Twilio Library Classes
//Name          : TwilioRestExample 
/******************************************************************************************/
public class TwilioRestExample {

    /* Twilio REST API version */
    public static final String APIVERSION = '2008-08-01';
    
    public static void init(){

        /* Twilio AccountSid and AuthToken */
        String AccountSid = 'AC892167ae706a8243478f802445ef5bab';
        String AuthToken = 'fa7e3c6af8c07fe8f06988fcb3dd3949';
        
        /* Outgoing Caller ID previously validated with Twilio */
        String CallerID = 'NNNNNNNNNN';
        
        /* Instantiate a new Twilio Rest Client */
        TwilioRestClient client = new TwilioRestClient(AccountSid, AuthToken, null);
        
        
        /* 
         * get list of past calls 
         *   is a GET to the Calls resources
         */
        //getCallsExample(client);        
        //system.debug('========================================');
        
        /* 
         * get list of outgoing calls 
         *   is a GET to the OutgoingCallerIds resources
         */
        getOutgoingCallerIdsExample(client);        
        system.debug('========================================');
        
         /* 
         * get list of account information 
         *   is a GET to the Accounts resources
         */
        //getAccountsExample(client);
        //system.debug('========================================');
        
        /* 
         * get list of Incoming Phone Numbers
         *   is a GET to the IncomingPhoneNumbers resources
         */
        //getIncomingPhoneNumbersExample(client);
        //system.debug('========================================');
        
        /* 
         * get recent developer notifications 
         * is a GET to the Notifications resource
         */
        //getNotificationsExample(client);
        //system.debug('========================================');
        
        /* 
         * get recent transcriptions 
         * is a GET to the Notifications resource
         */
        //getTranscriptionsExample(client);
        //system.debug('========================================');

        /*
         * get the recording for call
         * is a GET to the Recordings resource 
         * with a parameter CallSid to filter results for recordings 
         * on that call object
         */
        //getRecordingsExample( client,   'CA123456789012345678901234567890AF');    
        //system.debug('========================================');
    
    }
    
    /**
     * Example of making an outgoing call.
     * 
     * @param client authenticated twilio client object
     * @param AccountSid your accountId 
     * @param caller the caller id of the phone call
     * @param called the phone number to be called
     * @param url the URL to execute when the called party answers
     */
    private static void makeCallExample(TwilioRestClient client, String caller, String called, String url ){

        //build map of post parameters 
        Map<String,String> params = new Map<String,String>();
        params.put('Caller', caller);
        params.put('Called', called);
        params.put('Url', url);
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Calls', 'POST', params);
        
            if(response.isError())
                system.debug('Error making outgoing call: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                system.debug(response.getResponseText());

            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * Example of retrieving recent Calls made on your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getCallsExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Calls', 'GET',null);
        
            if(response.isError())
                system.debug('Error fetching recent calls: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                CallsXmlParser xmlParser = new CallsXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * Example of retrieving OutgoingCallerIds made on your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getOutgoingCallerIdsExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/OutgoingCallerIds', 'GET',null);
        
            if(response.isError())
                system.debug('Error fetching recent calls: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                OutgoingCallerIdsXmlParser xmlParser = new OutgoingCallerIdsXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * Example of retrieving IncomingPhoneNumbers made on your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getIncomingPhoneNumbersExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/IncomingPhoneNumbers', 'GET',null);
        
            if(response.isError())
                system.debug('Error fetching recent calls: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                IncomingPhoneNumbersXmlParser xmlParser = new IncomingPhoneNumbersXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * Example of retrieving Account Info made on your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getAccountsExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid(), 'GET',null);
        
            if(response.isError())
                system.debug('Error fetching recent calls: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                AccountsXmlParser xmlParser = new AccountsXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    
    /** 
     * Example of retrieving recent error and warning notifications from your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getNotificationsExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Notifications', 'GET',null);

            if(response.isError())
                system.debug('Error fetching recent notifications: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                NotificationsXmlParser xmlParser = new NotificationsXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }

    /** 
     * Example of retrieving transcriptions from your account
     * 
     * @param client authenticated twilio client object
     */
    private static void getTranscriptionsExample(TwilioRestClient client){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Transcriptions', 'GET',null);

            if(response.isError())
                system.debug('Error fetching recent notifications: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                TranscriptionsXmlParser xmlParser = new TranscriptionsXmlParser(response.getResponseText());
                
                system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * 
     * Example of retrieving the Recordings for an account, filtered by call id
     * 
     * @param client authenticated twilio client object
     * @param CallSid the twilio call ID string
     */
    private static void getRecordingsExample(TwilioRestClient client,  String CallSid){
        
        //build map of parameters 
        Map<String,String> params = new Map<String,String>();
        params.put('CallSid', CallSid);
        
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Recordings', 'GET',params);

            if(response.isError())
                system.debug('Error fetching recordings: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
               RecordingsXmlParser xmlParser = new RecordingsXmlParser(response.getResponseText());
                
               system.debug('Size: ' + xmlParser.listRecords.size() + ' ' + xmlParser.listRecords);
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
    
    /** 
     * Example of deleting a recording from your twilio account
     * 
     * @param client authenticated twilio client object
     * @param RecordingSid the twilio Recording Id String you wish to delete
     */
    private static void deleteRecordingsExample(TwilioRestClient client, String RecordingSid){
        TwilioRestResponse response;
        try {
            response = client.request('/'+APIVERSION+'/Accounts/'+client.getAccountSid()+'/Recordings/'+RecordingSid, 'GET',null);

            if(response.isError())
                system.debug('Error deleting recording: '+response.getHttpStatus()+'\n'+response.getResponseText());
            else {
                system.debug(response.getResponseText());
            }
        } catch (Exception e) {
            system.debug('Error: ' + e);
        }
    }
}