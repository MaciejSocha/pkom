package model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Date;

@XmlRootElement(name = "burger")
@XmlAccessorType (XmlAccessType.FIELD)
public class Burger {
    private String nazwa;
    private float cena;
    private int kaloryczność;

    @XmlAttribute
    private String data_wprowadzenia;
    @XmlAttribute
    private String miesnosc;

    public Burger(){};

    public Burger(String nazwa, String miesnosc, String data_wprowadzenia, float cena, int kaloryczność) {
        this.nazwa = nazwa;
        this.miesnosc = miesnosc;
        this.data_wprowadzenia = data_wprowadzenia;
        this.cena = cena;
        this.kaloryczność = kaloryczność;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public String getMiesnosc() {
        return miesnosc;
    }

    public void setMiesnosc(String miesnosc) {
        this.miesnosc = miesnosc;
    }

    public String getData_wprowadzenia() {
        return data_wprowadzenia;
    }

    public void setData_wprowadzenia(String dataWprowadzenia) {
        this.data_wprowadzenia = dataWprowadzenia;
    }

    public float getCena() {
        return cena;
    }

    public void setCena(float cena) {
        this.cena = cena;
    }

    public int getKalorycznosc() {
        return kaloryczność;
    }

    public void setKalorycznosc(int kaloryczność) {
        this.kaloryczność = kaloryczność;
    }
}
