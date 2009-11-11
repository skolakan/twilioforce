public class TwilioConfig {

	TwilioConfig__c myConfig = [select id,AccountSID__c, AuthToken__c,OutGoingCallerID__c,APIVERSION__c,ClickToCallURL__c from TwilioConfig__c LIMIT 1];
	
	public string AccountSID {
		get { return myConfig.AccountSID__c; }
	}
	
	public string APIVERSION {
		get { return myConfig.APIVERSION__c; }
	}

	public string AuthToken {
		get { return myConfig.AuthToken__c; }
	}
	
	public string ClickToCallURL {
		get { return myConfig.ClickToCallURL__c; }
	}
	
	public string OutGoingCallerID {
		get { return myConfig.OutGoingCallerID__c; }
	}
}