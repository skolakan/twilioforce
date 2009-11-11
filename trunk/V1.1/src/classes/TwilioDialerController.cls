public class TwilioDialerController {
	TwilioConfig CONFIG = new TwilioConfig();
    
    public string OutGoingCallerID { 
    	get { return CONFIG.OutGoingCallerID; }
    }
}