/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /Recordings Twilio API
//Name          : RecordingsXmlParser
/******************************************************************************************/
public class RecordingsXmlParser{
    //Store the list of all Recording Records
    public List<Recording> listRecords = new List<Recording>();
    //Recording Data Model
    public class Recording{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string CallSid{get;set;}
        public string Duration{get;set;}
        public string AccountSid{get;set;}
    }
    public RecordingsXmlParser(){
        
    }
    public RecordingsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public Recording[] parse(XmlStreamReader reader) {
        Recording[] members = new Recording[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('Recording' == reader.getLocalName()) {                 
                    Recording member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    
    //Will parse all Recording tag and its nested tag
    public Recording parseMember(XmlStreamReader reader){
        Recording RecordingObject = new Recording();
        while(reader.hasNext()) {
           
           if ('Recording' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                RecordingObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                RecordingObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                RecordingObject.DateUpdated= reader.getText(); 
              }
            }else if('Duration' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                RecordingObject.Duration= reader.getText(); 
              }
            }else if('Duration' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                RecordingObject.Duration= reader.getText(); 
              }
            }
            
           reader.next();
       }
       return RecordingObject;
    } 
}