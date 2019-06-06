package model;

import logic.XMLOperations;

public class Experiment {

    public static void main(String[] args) throws Exception {
         XMLOperations.readFromXML();
        System.out.println(XMLOperations.burgerownia);
    }
}
