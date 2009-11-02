/******************************************************************************************/
//Author        : Aslam Bari
//Date          : 27 Oct, 2009
//Description   : XmlResponse Parser for /Accounts Twilio API
//Name          : AccountsXmlParser
/******************************************************************************************/
public class AccountsXmlParser{
    //Account info will be stored in this list
    public List<AccountModel> listRecords = new List<AccountModel>();
    public class AccountModel{
        public string Sid{get;set;}
        public string DateCreated{get;set;}
        public string DateUpdated{get;set;}
        public string StatusText{get;set;}
        public string Status{get;set;}
        public string FriendlyName{get;set;}
        public string AuthToken{get;set;}
    }
    public AccountsXmlParser(){
        
    }
    public AccountsXmlParser(string data){
        XmlStreamReader xsr = new XmlStreamReader(data);
        listRecords = parse(xsr);
    }
    public AccountModel[] parse(XmlStreamReader reader) {
        AccountModel[] members = new AccountModel[0];
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
               if ('Account' == reader.getLocalName()) {                 
                    AccountModel member = parseMember(reader);
                    members.add(member);
                }
             }
            reader.next();
        }
        return members;
    }
    
    //All Account Tag and nested tags within it will be parsed
    public AccountModel parseMember(XmlStreamReader reader){
        AccountModel AccountModelObject = new AccountModel();
        while(reader.hasNext()) {
           
           if ('Account' == reader.getLocalName() && reader.getEventType() == XmlTag.END_ELEMENT) {
               break;
            }
            else if('Sid' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.Sid = reader.getText(); 
              }
            }else if('DateCreated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.DateCreated= reader.getText(); 
              }
            }else if('DateUpdated' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.DateUpdated= reader.getText(); 
              }
            }else if('FriendlyName' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.FriendlyName = reader.getText(); 
              }
            }else if('Status' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.Status= reader.getText(); 
              }
            }else if('AuthToken' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.AuthToken= reader.getText(); 
              }
            }else if('StatusText' == reader.getLocalName() && reader.getEventType() == XmlTag.START_ELEMENT){
              reader.next();                   
              if(reader.getEventType() == XmlTag.CHARACTERS) { 
                AccountModelObject.StatusText= reader.getText(); 
              }
            }
            
           reader.next();
       }
       return AccountModelObject;
    } 
}