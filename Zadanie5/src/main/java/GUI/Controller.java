package GUI;

import generated.*;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import logic.XMLOperations;

import javax.xml.bind.JAXBException;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.awt.List;
import java.io.FileNotFoundException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URL;
import java.time.LocalDate;
import java.util.*;

public class Controller implements Initializable {
    @FXML
    public ListView<String> listView;
    @FXML
    public ComboBox<MiesnoscBase> miesnosc = new ComboBox<>();
    @FXML
    public TextField nazwa = new TextField();
    @FXML
    public TextField cena = new TextField();
    @FXML
    public TextField kalorycznosc = new TextField();
    @FXML
    public ComboBox skladnik1 = new ComboBox();
    @FXML
    public ComboBox skladnik2 = new ComboBox();
    @FXML
    public ComboBox skladnik3 = new ComboBox();
    @FXML
    public ComboBox skladnik4 = new ComboBox();
    @FXML
    public ComboBox skladnik5 = new ComboBox();
    @FXML
    public ComboBox skladnik6 = new ComboBox();
    @FXML
    public ComboBox skladnik7 = new ComboBox();
    @FXML
    public ComboBox skladnik8 = new ComboBox();
    @FXML
    public DatePicker data = new DatePicker();
    @FXML
    public TextField imie1 = new TextField();
    @FXML
    public TextField imie2 = new TextField();
    @FXML
    public TextField nazwisko1 = new TextField();
    @FXML
    public TextField nazwisko2 = new TextField();
    @FXML
    public TextField projekt = new TextField();
    @FXML
    public DatePicker modyfikacja = new DatePicker();
    @FXML
    public TextField path_save = new TextField();
    @FXML
    public TextField path_read = new TextField();

    private Burgerownia burgerownia;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        miesnosc.getItems().addAll(MiesnoscBase.values());
        try {
            XMLOperations.readFromXML();
        } catch (JAXBException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        burgerownia = XMLOperations.burgerownia;
        lista();
        ArrayList<String> skl = new ArrayList<>();
        skl.add("");
        for (Składnik sk : burgerownia.getListaSkładników().getSkładnik()) {
            skl.add(sk.getValue());
        }

        skladnik1.setItems(FXCollections.observableArrayList(skl));
        skladnik2.setItems(FXCollections.observableArrayList(skl));
        skladnik3.setItems(FXCollections.observableArrayList(skl));
        skladnik4.setItems(FXCollections.observableArrayList(skl));
        skladnik5.setItems(FXCollections.observableArrayList(skl));
        skladnik6.setItems(FXCollections.observableArrayList(skl));
        skladnik7.setItems(FXCollections.observableArrayList(skl));
        skladnik8.setItems(FXCollections.observableArrayList(skl));
    }

    public void clear() {
        nazwa.clear();
        cena.clear();
        kalorycznosc.clear();
        clearSKL();
        System.out.println("clear");
    }

    private void clearSKL() {
        skladnik1.getSelectionModel().select(0);
        skladnik2.getSelectionModel().select(0);
        skladnik3.getSelectionModel().select(0);
        skladnik4.getSelectionModel().select(0);
        skladnik5.getSelectionModel().select(0);
        skladnik6.getSelectionModel().select(0);
        skladnik7.getSelectionModel().select(0);
        skladnik8.getSelectionModel().select(0);
    }

    public void delete() {
        System.out.println("Usuń");
        ArrayList<Burger> remove = new ArrayList<>();
        String name = listView.getSelectionModel().getSelectedItem();
        for (Burger b : burgerownia.getListaBurgerów().getBurger()) {
            if (b.getNazwa().equals(name)) {
                remove.add(b);
            }
        }
        burgerownia.getListaBurgerów().getBurger().removeAll(remove);
        lista();

    }

    public void add() {
        System.out.println("dodaj");

        Kaloryczność k = new Kaloryczność();
        int kal = Integer.parseInt(kalorycznosc.getText());
        k.setValue(BigInteger.valueOf(kal));
        k.setJednostka("kcal");

        Cena c = new Cena();
        c.setValue(BigDecimal.valueOf(Double.parseDouble(cena.getText())).setScale(2));
        c.setWaluta("zł");

        Burger b = new Burger();
        b.setNazwa(nazwa.getText());
        b.setMięsność(miesnosc.getValue());
        LocalDate d = data.getValue();

        XMLGregorianCalendar cal = null;
        try {
            cal = DatatypeFactory.newInstance().newXMLGregorianCalendar(d.toString());
        } catch (DatatypeConfigurationException e) {
            e.printStackTrace();
        }

        b.setDataWprowadzenia(cal);

        b.setKaloryczność(k);
        b.setCena(c);


        b.setSkladnik1(convertToID((String)skladnik1.getSelectionModel().getSelectedItem()));
        b.setSkladnik2(convertToID((String)skladnik2.getSelectionModel().getSelectedItem()));
        b.setSkladnik3(convertToID((String)skladnik3.getSelectionModel().getSelectedItem()));
        b.setSkladnik4(convertToID((String)skladnik4.getSelectionModel().getSelectedItem()));
        b.setSkladnik5(convertToID((String)skladnik5.getSelectionModel().getSelectedItem()));
        b.setSkladnik6(convertToID((String)skladnik6.getSelectionModel().getSelectedItem()));
        b.setSkladnik7(convertToID((String)skladnik7.getSelectionModel().getSelectedItem()));
        b.setSkladnik8(convertToID((String)skladnik8.getSelectionModel().getSelectedItem()));

        burgerownia.getListaBurgerów().getBurger().add(b);

        lista();
    }

    public void updateBurger() {
        String name = listView.getSelectionModel().getSelectedItem();
        Burger burger = burgerownia.getListaBurgerów().getBurger().stream().filter(b -> b.getNazwa().equals(name)).findFirst().get();
        int id = burgerownia.getListaBurgerów().getBurger().indexOf(burger);
        Burger newBurger = new Burger();

        Kaloryczność kaloryczność = new Kaloryczność();
        int kal = Integer.parseInt(kalorycznosc.getText());
        kaloryczność.setJednostka("kcal");
        kaloryczność.setValue(BigInteger.valueOf(kal));


        Cena cen = new Cena();
        cen.setWaluta("zł");
        cen.setValue(BigDecimal.valueOf(Double.parseDouble(cena.getText())).setScale(2));


        newBurger.setMięsność(miesnosc.getValue());
        newBurger.setNazwa(nazwa.getText());
        LocalDate dat = data.getValue();

        newBurger.setSkladnik1(convertToID((String)skladnik1.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik2(convertToID((String)skladnik2.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik3(convertToID((String)skladnik3.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik4(convertToID((String)skladnik4.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik5(convertToID((String)skladnik5.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik6(convertToID((String)skladnik6.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik7(convertToID((String)skladnik7.getSelectionModel().getSelectedItem()));
        newBurger.setSkladnik8(convertToID((String)skladnik8.getSelectionModel().getSelectedItem()));

        XMLGregorianCalendar cal = null;
        try {
            cal = DatatypeFactory.newInstance().newXMLGregorianCalendar(dat.toString());
        } catch (DatatypeConfigurationException e) {
            e.printStackTrace();
        }

        newBurger.setDataWprowadzenia(cal);

        newBurger.setKaloryczność(kaloryczność);
        newBurger.setCena(cen);

        burgerownia.getListaBurgerów().getBurger().set(id, newBurger);



    }

    private String convertToID(String nazwa) {
        if (nazwa != null && nazwa != "")
            return burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getValue().equals(nazwa)).findFirst().get().getIdSkładnika();
        else return null;
    }

    public void save() {
        System.out.println("Zapisz");


        saveXMLFile();
    }

    public void toTXT() {
        System.out.println("robie txt");
        String path = path_save.getText();
        transformToXHTML(path);
    }

    public void select() {
        System.out.println("Wybrano");
        clearSKL();
        Burger burger = burgerownia.getListaBurgerów().getBurger().stream().filter(b -> b.getNazwa().equals(listView.getSelectionModel().getSelectedItem())).findFirst().get();

        nazwa.setText(burger.getNazwa());
        cena.setText(String.valueOf(burger.getCena().getValue()));
        kalorycznosc.setText(String.valueOf(burger.getKaloryczność().getValue()));

        Optional<Składnik> skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik1())).findFirst();
        skladnik.ifPresent(składnik -> skladnik1.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik2())).findFirst();
        skladnik.ifPresent(składnik -> skladnik2.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik3())).findFirst();
        skladnik.ifPresent(składnik -> skladnik3.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik4())).findFirst();
        skladnik.ifPresent(składnik -> skladnik4.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik5())).findFirst();
        skladnik.ifPresent(składnik -> skladnik5.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik6())).findFirst();
        skladnik.ifPresent(składnik -> skladnik6.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik7())).findFirst();
        skladnik.ifPresent(składnik -> skladnik7.getSelectionModel().select(składnik.getValue()));
        skladnik = burgerownia.getListaSkładników().getSkładnik().stream().filter(s -> s.getIdSkładnika().equals(burger.getSkladnik8())).findFirst();
        skladnik.ifPresent(składnik -> skladnik8.getSelectionModel().select(składnik.getValue()));

        if (burger.getMięsność().name().equals("MIĘSNY"))
            miesnosc.getSelectionModel().select(0);
        if (burger.getMięsność().name().equals("WEGETARIAŃSKI"))
            miesnosc.getSelectionModel().select(1);
        if (burger.getMięsność().name().equals("WEGAŃSKI"))
            miesnosc.getSelectionModel().select(2);
        data.setValue(LocalDate.parse(String.valueOf(burger.getDataWprowadzenia())));

    }


    private void saveXMLFile() {
        try {
            XMLOperations.saveToXML("burgerownia");
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    public void openDifferentXMLFile() {
        String name = path_read.getText();
        XMLOperations.setXmlFilePath(name);
        try {
            XMLOperations.readFromXML();
        } catch (JAXBException | FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void transformToXHTML(String path) {
        XMLOperations.transformXML(path);
    }

    public void metadane(){
        imie1.setText(burgerownia.getMetadane().getAutor().get(0).getImie());
        imie2.setText(burgerownia.getMetadane().getAutor().get(1).getImie());
        nazwisko1.setText(burgerownia.getMetadane().getAutor().get(0).getNazwisko());
        nazwisko2.setText(burgerownia.getMetadane().getAutor().get(1).getNazwisko());
        projekt.setText(burgerownia.getMetadane().getNazwaProjektu());
        modyfikacja.setValue(LocalDate.parse(String.valueOf((burgerownia.getMetadane().getDataModyfikacji()))));
    }

    private void lista() {
        ArrayList<String> nazwy = new ArrayList<>();
        for (Burger burger :
                burgerownia.getListaBurgerów().getBurger()) {
            nazwy.add(burger.getNazwa());
        }
        listView.setItems(FXCollections.observableArrayList(nazwy));
    }

    public void saveMeta(){
        burgerownia.getMetadane().setNazwaProjektu(projekt.getText());
        burgerownia.getMetadane().getAutor().get(0).setImie(imie1.getText());
        burgerownia.getMetadane().getAutor().get(1).setImie(imie2.getText());
        burgerownia.getMetadane().getAutor().get(0).setNazwisko(nazwisko1.getText());
        burgerownia.getMetadane().getAutor().get(1).setNazwisko(nazwisko2.getText());
        try {
            burgerownia.getMetadane().setDataModyfikacji(DatatypeFactory.newInstance().newXMLGregorianCalendar(modyfikacja.getValue().toString()));
        } catch (DatatypeConfigurationException e) {
            e.printStackTrace();
        }
        saveXMLFile();
    }

}
