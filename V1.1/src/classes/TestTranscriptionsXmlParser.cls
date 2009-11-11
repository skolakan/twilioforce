/******************************************************************************************/
//Name          : TestTranscriptionsXmlParser
//Author        : Aslam Bari
//Date          : Nov 06, 2009
//Description   : Test Class to cover code coverage for TranscriptionsXmlParser

/******************************************************************************************/
public class TestTranscriptionsXmlParser{
    @isTest
    public static void TestTranscriptionsXmlParserMethod1(){
        TranscriptionsXmlParser callxml = new TranscriptionsXmlParser();
        String xmlData = '<TwilioResponse><Transcriptions page=\"0\" numpages=\"1\" pagesize=\"50\" total=\"2\" start=\"0\" end=\"1\"><Transcription><Sid>TR685e9a2bdf89b978491b1afada63f078</Sid><DateCreated>1235986685</DateCreated><DateUpdated>1235957975</DateUpdated>';
        xmlData = xmlData + '<AccountSid>AC309475e5fede1b49e100272a8640f438</AccountSid><Status>completed</Status><RecordingSid>RE3870404da563592ef6a72136438a879c</RecordingSid><Duration>9</Duration><TranscriptionText>';
        xmlData = xmlData + 'This is the body of one transcribed recording</TranscriptionText><Price>-0.25000</Price></Transcription><Transcription><Sid>TRbdece5b75f2cd8f6ef38e0a10f5c4447</Sid><DateCreated>1235986685</DateCreated><DateUpdated>1235957924</DateUpdated>';
        xmlData = xmlData + '<AccountSid>AC5ea872f6da5a21de157d80997a64bd33</AccountSid><Status>completed</Status><RecordingSid>RE3870404da563592ef6a72136438a879c</RecordingSid><Duration>9</Duration><TranscriptionText>This is the body of another transcribed recording</TranscriptionText>';
        xmlData = xmlData + '<Price>-0.03000</Price></Transcription></Transcriptions></TwilioResponse>   ';
        
        TranscriptionsXmlParser callxml1 = new TranscriptionsXmlParser(xmlData);
    }
}