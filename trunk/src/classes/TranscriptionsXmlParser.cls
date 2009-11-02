/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /Transcriptions Twilio API
//Name          : TranscriptionsXmlParser
/******************************************************************************************/
public class TranscriptionsXmlParser{
    //All Transcription Records will be stored in this list
    public List<Transcription> listRecords = new List<Transcription>();
    //Transcription Data Model
    public class Transcription{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string Status{get;set;}
        public string RecordingSid{get;set;}
        public string AccountSid{get;set;}
        public string Duration{get;set;}
        public string TranscriptionText{get;set;}
        public string Price{get;set;}
    }
    public TranscriptionsXmlParser(){
        
    }
    public TranscriptionsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public Transcription[] parse(XmlStreamReader reader) {
        Transcription[] members = new Transcription[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('Transcription' == reader.getLocalName()) {                 
                    Transcription member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    
    //Will parse all Transcription tag and its nested tags
    public Transcription parseMember(XmlStreamReader reader){
        Transcription TranscriptionObject = new Transcription();
        while(reader.hasNext()) {
           
           if ('Transcription' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.DateUpdated= reader.getText(); 
              }
            }else if('Status' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.Status = reader.getText(); 
              }
            }else if('AccountSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.AccountSid = reader.getText(); 
              }
            }else if('RecordingSid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.RecordingSid = reader.getText(); 
              }
            }else if('Duration' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.Duration = reader.getText(); 
              }
            }else if('TranscriptionText' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.TranscriptionText = reader.getText(); 
              }
            }else if('Price' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                TranscriptionObject.Price = reader.getText(); 
              }
            }
            
           reader.next();
       }
       return TranscriptionObject;
    } 
}