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
        for (Burger burger :
                burgerownia.getListaBurgerów().getBurger()) {
            if (burger.getNazwa().equals(listView.getSelectionModel().getSelectedItem())) {
                nazwa.setText(burger.getNazwa());
                cena.setText(String.valueOf(burger.getCena().getValue()));
                kalorycznosc.setText(String.valueOf(burger.getKaloryczność().getValue()));


            }

            switch (burger.getSkladnik1()) {
                case "ser":
                    skladnik1.getSelectionModel().select(0);
                    break;
                case "mieso_wieprzowe":
                    skladnik1.getSelectionModel().select(1);
                    break;
                case "mieso_wolowe":
                    skladnik1.getSelectionModel().select(2);
                    break;
                case "mieso_drobiowe":
                    skladnik1.getSelectionModel().select(3);
                    break;
                case "boczek":
                    skladnik1.getSelectionModel().select(4);
                    break;
                case "bulka_pszenna_sezam":
                    skladnik1.getSelectionModel().select(5);
                    break;
                case "bulka_pszenna":
                    skladnik1.getSelectionModel().select(6);
                    break;
                case "bulka_zytnia":
                    skladnik1.getSelectionModel().select(7);
                    break;
                case "salata":
                    skladnik1.getSelectionModel().select(8);
                    break;
                case "pomidor":
                    skladnik1.getSelectionModel().select(9);
                    break;
                case "ogorek":
                    skladnik1.getSelectionModel().select(10);
                    break;
                case "ketchup":
                    skladnik1.getSelectionModel().select(11);
                    break;
                case "losos":
                    skladnik1.getSelectionModel().select(12);
                    break;
                case "cebula":
                    skladnik1.getSelectionModel().select(13);
                    break;
                case "papryka":
                    skladnik1.getSelectionModel().select(14);
                    break;
                case "falafel":
                    skladnik1.getSelectionModel().select(15);
                    break;
                case "piri_piri":
                    skladnik1.getSelectionModel().select(16);
                    break;
                case "majonez":
                    skladnik1.getSelectionModel().select(17);
                    break;
                case "rukola":
                    skladnik1.getSelectionModel().select(18);
                    break;
                case "jajko":
                    skladnik1.getSelectionModel().select(19);
                    break;
                case "prazone_orzechy":
                    skladnik1.getSelectionModel().select(20);
                    break;
                case "krewetki":
                    skladnik1.getSelectionModel().select(21);
                    break;
                case "musztarda":
                    skladnik1.getSelectionModel().select(22);
                    break;
                case "sos_sojowy":
                    skladnik1.getSelectionModel().select(23);
                    break;
                case "sos_serowy_chili":
                    skladnik1.getSelectionModel().select(24);
                    break;
                case "chili":
                    skladnik1.getSelectionModel().select(25);
                    break;
            }

            if (burger.getMięsność().name().equals("MIĘSNY"))
                miesnosc.getSelectionModel().select(0);
            if (burger.getMięsność().name().equals("WEGETARIAŃSKI"))
                miesnosc.getSelectionModel().select(1);
            if (burger.getMięsność().name().equals("WEGAŃSKI"))
                miesnosc.getSelectionModel().select(2);
            data.setValue(LocalDate.parse(String.valueOf(burger.getDataWprowadzenia())));
        }
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
