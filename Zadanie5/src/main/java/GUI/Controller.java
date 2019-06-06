package GUI;

import generated.MiesnoscBase;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;

import java.net.URL;
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

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        listView.setItems(FXCollections.observableArrayList("AAA", "BBB"));
        miesnosc.getItems().addAll(MiesnoscBase.values());
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
}
