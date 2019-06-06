package logic;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import java.io.IOException;
import java.net.URISyntaxException;

public class Test {
    public static void main(String[] args) {
        try {
            XMLOperations.setXmlFilePath("burgerownia.xml");
            XMLOperations.readFromXML();
            XMLOperations.transformXML();
        } catch (JAXBException | IOException e) {
            e.printStackTrace();
        }
    }
}
