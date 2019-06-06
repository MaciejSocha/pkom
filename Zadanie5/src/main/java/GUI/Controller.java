package GUI;

import generated.Burger;
import generated.Burgerownia;
import generated.MiesnoscBase;
import generated.Składnik;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import logic.XMLOperations;

import javax.xml.bind.JAXBException;
import java.io.FileNotFoundException;
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
        ArrayList<String> nazwy = new ArrayList<>();
        for (Burger burger :
                burgerownia.getListaBurgerów().getBurger()) {
            nazwy.add(burger.getNazwa());
        }
        listView.setItems(FXCollections.observableArrayList(nazwy));
        ArrayList<String> skl = new ArrayList<>();
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
        System.out.println("clear");
    }

    public void delete() {
        System.out.println("Usuń");
    }

    public void add() {
        System.out.println("dodaj");
    }

    public void save() {
        System.out.println("Zapisz");
    }

    public void toTXT() {
        System.out.println("robie txt");
    }

    public void select() {
        System.out.println("Wybrano");
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


    public void saveXMLFile() {
        try {
            XMLOperations.saveToXML("textarea.getText()");
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    public void openDifferentXMLFile() {
        XMLOperations.setXmlFilePath("textarea.gettext()");
        try {
            XMLOperations.readFromXML();
        } catch (JAXBException | FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void transformToXHTML() {
        XMLOperations.transformXML("textarea.gettext()");
    }


}
