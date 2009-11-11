/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /OutgoingCallerIds Twilio API
//Name          : OutgoingCallerIdsXmlParser
/******************************************************************************************/
public class OutgoingCallerIdsXmlParser{
    //All Parsed OutgoingCallerIds will be stored in this list
    public List<OutgoingCallerId> listRecords = new List<OutgoingCallerId>();
    public class OutgoingCallerId{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string PhoneNumber{get;set;}
        public string AccountSid{get;set;}
        public string FriendlyName{get;set;}
    }
    public OutgoingCallerIdsXmlParser(){
        
    }
    public OutgoingCallerIdsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public OutgoingCallerId[] parse(XmlStreamReader reader) {
        OutgoingCallerId[] members = new OutgoingCallerId[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('OutgoingCallerId' == reader.getLocalName()) {                 
                    OutgoingCallerId member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    
    //Parsing each OutgoingCallerId tag and its nested tags
    public OutgoingCallerId parseMember(XmlStreamReader reader){
        OutgoingCallerId OutgoingCallerIdObject = new OutgoingCallerId();
        while(reader.hasNext()) {
           
           if ('OutgoingCallerId' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.DateUpdated= reader.getText(); 
              }
            }else if('FriendlyName' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.FriendlyName= reader.getText(); 
              }
            }else if('AccountSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.AccountSid= reader.getText(); 
              }
            }else if('PhoneNumber' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                OutgoingCallerIdObject.PhoneNumber = reader.getText(); 
              }
            }
            
           reader.next();
       }
       return OutgoingCallerIdObject;
    } 
}