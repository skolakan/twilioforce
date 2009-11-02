/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /IncomingPhoneNumbers Twilio API
//Name          : IncomingPhoneNumbersXmlParser
/******************************************************************************************/
public class IncomingPhoneNumbersXmlParser{
    public List<IncomingPhoneNumber> listRecords = new List<IncomingPhoneNumber>();
    public class IncomingPhoneNumber{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string Url{get;set;}
        public string Method{get;set;}
        public string FriendlyName{get;set;}
        public string AccountSid{get;set;}
    }
    public IncomingPhoneNumbersXmlParser(){
        
    }
    public IncomingPhoneNumbersXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public IncomingPhoneNumber[] parse(XmlStreamReader reader) {
        IncomingPhoneNumber[] members = new IncomingPhoneNumber[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('IncomingPhoneNumber' == reader.getLocalName()) {                 
                    IncomingPhoneNumber member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    public IncomingPhoneNumber parseMember(XmlStreamReader reader){
        IncomingPhoneNumber IncomingPhoneNumberObject = new IncomingPhoneNumber();
        while(reader.hasNext()) {
           
           if ('IncomingPhoneNumber' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.DateUpdated= reader.getText(); 
              }
            }else if('FriendlyName' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.FriendlyName = reader.getText(); 
              }
            }else if('Method' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.Method = reader.getText(); 
              }
            }else if('Url' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                IncomingPhoneNumberObject.Url= reader.getText(); 
              }
            }
            
           reader.next();
       }
       return IncomingPhoneNumberObject;
    } 
}