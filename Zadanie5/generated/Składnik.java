//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2019.06.06 at 08:36:23 PM CEST 
//


package generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlValue;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;simpleContent>
 *     &lt;extension base="&lt;http://www.w3.org/2001/XMLSchema>string">
 *       &lt;attGroup ref="{}składnikGroup"/>
 *     &lt;/extension>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "value"
})
@XmlRootElement(name = "sk\u0142adnik")
public class Składnik {

    @XmlValue
    protected String value;
    @XmlAttribute(name = "alergen")
    protected String alergen;
    @XmlAttribute(name = "idSk\u0142adnika", required = true)
    protected String idSkładnika;

    /**
     * Gets the value of the value property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getValue() {
        return value;
    }

    /**
     * Sets the value of the value property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * Gets the value of the alergen property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAlergen() {
        return alergen;
    }

    /**
     * Sets the value of the alergen property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAlergen(String value) {
        this.alergen = value;
    }

    /**
     * Gets the value of the idSkładnika property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIdSkładnika() {
        return idSkładnika;
    }

    /**
     * Sets the value of the idSkładnika property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdSkładnika(String value) {
        this.idSkładnika = value;
    }

}
