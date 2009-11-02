/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /Calls Twilio API
//Name          : CallsXmlParser
/******************************************************************************************/
public class CallsXmlParser{
    //All Parsed records will be in this list
    public List<Call> listRecords = new List<Call>();
    //Data Model to store all response elements
    public class Call{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string CallSegmentSid{get;set;}
        public string AccountSid{get;set;}
        public string Called{get;set;}
        public string Caller{get;set;}
        public string PhoneNumberSid{get;set;}
        public string Status{get;set;}
        public string StartTime{get;set;}
        public string EndTime{get;set;}
        public string Duration{get;set;}
        public string Price{get;set;}
        public string Flags{get;set;}
        public string Annotation{get;set;}
    }
    public CallsXmlParser(){
        
    }
    public CallsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public Call[] parse(XmlStreamReader reader) {
        Call[] members = new Call[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('Call' == reader.getLocalName()) {                 
                    Call member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    //Parsing Each Call Tag and its nested tags
    public Call parseMember(XmlStreamReader reader){
        Call callObject = new Call();
        while(reader.hasNext()) {
           
           if ('Call' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.DateUpdated= reader.getText(); 
              }
            }else if('CallSegmentSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.CallSegmentSid= reader.getText(); 
              }
            }else if('AccountSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.AccountSid= reader.getText(); 
              }
            }else if('Called' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Called= reader.getText(); 
              }
            }else if('Caller' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Caller= reader.getText(); 
              }
            }else if('PhoneNumberSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.PhoneNumberSid= reader.getText(); 
              }
            }else if('Status' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Status = reader.getText(); 
              }
            }else if('StartTime' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.StartTime = reader.getText(); 
              }
            }else if('EndTime' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.EndTime = reader.getText(); 
              }
            }else if('Duration' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Duration = reader.getText(); 
              }
            }else if('Price' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Price = reader.getText(); 
              }
            }else if('Flags' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Flags = reader.getText(); 
              }
            }else if('Annotation' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                callObject.Annotation = reader.getText(); 
              }
            }
            
           reader.next();
       }
       return callObject;
    } 
}