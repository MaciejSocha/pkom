package logic;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;

import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import generated.Burgerownia;
import net.sf.saxon.Transform;
import net.sf.saxon.TransformerFactoryImpl;
import org.xml.sax.SAXException;

public class XMLOperations {

    private static JAXBContext jaxbContext;
    private static Unmarshaller unmarshaller;
    private static Marshaller marshaller;
    private static String xmlFilePath;
    private static Schema schema;

    public static Burgerownia burgerownia;

    static {
        xmlFilePath = "burgerownia.xml";
        try {
            jaxbContext = JAXBContext.newInstance(Burgerownia.class);
            unmarshaller = jaxbContext.createUnmarshaller();
            SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            schema = schemaFactory.newSchema(new File("burgerownia.xsd"));
            marshaller = jaxbContext.createMarshaller();
            marshaller.setSchema(schema);
            //marshaller.setEventHandler(new OwnValidationEventHandler());
            marshaller.setProperty(Marshaller.JAXB_NO_NAMESPACE_SCHEMA_LOCATION, "burgerownia.xsd");
            unmarshaller.setSchema(schema);
            //unmarshaller.setEventHandler(new OwnValidationEventHandler());
        } catch (JAXBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void saveToXML() throws JAXBException {
        marshaller.marshal(burgerownia, new File(xmlFilePath));
    }

    public static void readFromXML() throws JAXBException, FileNotFoundException {
        burgerownia = (Burgerownia) unmarshaller.unmarshal(new FileInputStream(new File(xmlFilePath)));
    }

    public static void transformXML()  {
        String[] arglist1 = {"-o:raport.xml","burgerownia.xml", "burgerownia_raport.xsl"};
        Transform.main(arglist1);
        String[] arglist2 = {"-o:raport.xhtml","raport.xml", "burgerownia_xhtml.xsl"};
        Transform.main(arglist2);
    }

    public static String getXmlFilePath() {
        return xmlFilePath;
    }

    public static void setXmlFilePath(String xmlFilePath) {
        XMLOperations.xmlFilePath = xmlFilePath;
    }

}