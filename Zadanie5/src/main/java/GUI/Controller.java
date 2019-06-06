package GUI;

import generated.Burger;
import generated.Burgerownia;
import generated.MiesnoscBase;
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
import java.util.ArrayList;
import java.util.ResourceBundle;

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
    public TextField skladnik1 = new TextField();
    @FXML
    public TextField skladnik2 = new TextField();
    @FXML
    public TextField skladnik3 = new TextField();
    @FXML
    public TextField skladnik4 = new TextField();
    @FXML
    public TextField skladnik5 = new TextField();
    @FXML
    public TextField skladnik6 = new TextField();
    @FXML
    public TextField skladnik7 = new TextField();
    @FXML
    public TextField skladnik8 = new TextField();
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
        for (Burger burger:
             burgerownia.getListaBurgerów().getBurger()) {
            nazwy.add(burger.getNazwa());
        }
        listView.setItems(FXCollections.observableArrayList(nazwy));
    }

    public void clear(){
        nazwa.clear();
        cena.clear();
        kalorycznosc.clear();
        skladnik1.clear();
        skladnik2.clear();
        skladnik3.clear();
        skladnik4.clear();
        skladnik5.clear();
        skladnik6.clear();
        skladnik7.clear();
        skladnik8.clear();
        System.out.println("clear");
    }

    public void delete(){
        System.out.println("Usuń");
    }

    public void add(){
        System.out.println("dodaj");
    }

    public void save(){
        System.out.println("Zapisz");
    }

    public void toTXT(){
        System.out.println("robie txt");
    }

    public void select(){
        System.out.println("Wybrano");
        for (Burger burger:
                burgerownia.getListaBurgerów().getBurger()) {
            if (burger.getNazwa().equals(listView.getSelectionModel().getSelectedItem())){
                nazwa.setText(burger.getNazwa());
                cena.setText(String.valueOf(burger.getCena().getValue()));
                kalorycznosc.setText(String.valueOf(burger.getKaloryczność().getValue()));
                skladnik1.setText(burger.getSkladnik1());
                skladnik2.setText(burger.getSkladnik2());
                skladnik3.setText(burger.getSkladnik3());
                skladnik4.setText(burger.getSkladnik4());
                skladnik5.setText(burger.getSkladnik5());
                skladnik6.setText(burger.getSkladnik6());
                skladnik7.setText(burger.getSkladnik7());
                skladnik8.setText(burger.getSkladnik8());
                if (burger.getMięsność().name().equals("MIĘSNY"))
                    miesnosc.getSelectionModel().select(0);
                if (burger.getMięsność().name().equals("WEGETARIAŃSKI"))
                    miesnosc.getSelectionModel().select(1);
                if (burger.getMięsność().name().equals("WEGAŃSKI"))
                    miesnosc.getSelectionModel().select(2);
                data.setValue(LocalDate.parse(String.valueOf(burger.getDataWprowadzenia())));
            }
        }
    }
}
