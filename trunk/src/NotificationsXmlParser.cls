/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /Notifications Twilio API
//Name          : NotificationsXmlParser
/******************************************************************************************/
public class NotificationsXmlParser{
    //All Notification records will be stored in this list
    public List<Notification> listRecords = new List<Notification>();
    //Notification Data Model
    public class Notification{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string CallSid{get;set;}
        public string Log{get;set;}
        public string AccountSid{get;set;}
        public string ErrorCode{get;set;}
        public string MoreInfo{get;set;}
        public string RequestURL{get;set;}
        public string RequestMethod{get;set;}
        public string MessageText{get;set;}
        public string MessageDate{get;set;}
    }
    public NotificationsXmlParser(){
        
    }
    public NotificationsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public Notification[] parse(XmlStreamReader reader) {
        Notification[] members = new Notification[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('Notification' == reader.getLocalName()) {                 
                    Notification member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    
    //Each Notification tag and its nested tag will be parsed
    public Notification parseMember(XmlStreamReader reader){
        Notification NotificationObject = new Notification();
        while(reader.hasNext()) {
           
           if ('Notification' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.DateUpdated= reader.getText(); 
              }
            }else if('RequestURL' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.RequestURL= reader.getText(); 
              }
            }else if('MessageText' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.MessageText= reader.getText(); 
              }
            }else if('MessageDate' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.MessageDate = reader.getText(); 
              }
            }else if('RequestMethod' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.RequestMethod= reader.getText(); 
              }
            }else if('RequestURL' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.RequestURL = reader.getText(); 
              }
            }else if('ErrorCode' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.ErrorCode = reader.getText(); 
              }
            }else if('Log' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                NotificationObject.Log = reader.getText(); 
              }
            }
            
           reader.next();
       }
       return NotificationObject;
    } 
}