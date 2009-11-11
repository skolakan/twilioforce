public class ClickToCallController {

		private final Contact contact;
		public ClickToCallController(ApexPages.StandardController controller) {
			this.contact = (Contact)controller.getRecord();
		}
		
        TwilioConfig CONFIG = new TwilioConfig();
        public string OutGoingCallerID { 
        	get { return CONFIG.OutGoingCallerID; }
        }
        
        public string ReturnCode { get; set; }
         
        public string TwilioTarget {
        	get {
        		User currentUser = [select TwilioPhone__c from User where id = :UserInfo.getUserId()];
        		return currentUser.TwilioPhone__c;
        	}
        } 
        public PageReference ClickToCallAction() {
                TwilioRestClient client = new TwilioRestClient(CONFIG.AccountSID, CONFIG.AuthToken, null);
                Map<String,String> params = new Map<String,String>();
                params.put('Caller', CONFIG.OutGoingCallerID);
                params.put('Called', TwilioTarget);
                params.put('Url', CONFIG.ClickToCallURL + '?Called=' + EncodingUtil.urlEncode(contact.phone, 'UTF-8'));
                
                TwilioRestResponse response;
                try {
                    response = client.request('/'+CONFIG.APIVERSION+'/Accounts/'+CONFIG.AccountSID+'/Calls', 'POST', params);
                    ReturnCode = 'Called Placed: Connecting ' + TwilioTarget + ' with ' + contact.Phone;
                    return null;
                } catch (Exception e) {
                    ReturnCode = 'ERROR: ' + e;
                    return null;
                }
        }
        
}