package model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "burgerownia")
@XmlAccessorType(XmlAccessType.FIELD)
public class Burgerownia {
    @XmlElement(name = "lista_burgerów")
    private ListaBurgerów listaBurgerów;

    public ListaBurgerów getListaBurgerów() {
        return listaBurgerów;
    }

    public void setListaBurgerów(ListaBurgerów listaBurgerów) {
        this.listaBurgerów = listaBurgerów;
    }
}
