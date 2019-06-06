package model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;


@XmlRootElement(name = "lista_burgerów")
@XmlAccessorType(XmlAccessType.FIELD)
public class ListaBurgerów {
    @XmlElement(name = "burger")
    private List<Burger> listaBurgerów = null;

    public List<Burger> getListaBurgerów() {
        return listaBurgerów;
    }

    public void setListaBurgerów(List<Burger> listaBurgerów) {
        this.listaBurgerów = listaBurgerów;
    }
}

