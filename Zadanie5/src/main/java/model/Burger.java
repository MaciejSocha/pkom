package main.java.model;

import java.util.Date;

public class Burger {
    private String nazwa;
    private Miesnosc miesnosc;
    private Date dataWprowadzenia;
    private float cena;
    private Waluta waluta;
    private int kalorycznosc;

    public Burger(String nazwa, Miesnosc miesnosc, Date dataWprowadzenia, float cena, Waluta waluta, int kalorycznosc) {
        this.nazwa = nazwa;
        this.miesnosc = miesnosc;
        this.dataWprowadzenia = dataWprowadzenia;
        this.cena = cena;
        this.waluta = waluta;
        this.kalorycznosc = kalorycznosc;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public Miesnosc getMiesnosc() {
        return miesnosc;
    }

    public void setMiesnosc(Miesnosc miesnosc) {
        this.miesnosc = miesnosc;
    }

    public Date getDataWprowadzenia() {
        return dataWprowadzenia;
    }

    public void setDataWprowadzenia(Date dataWprowadzenia) {
        this.dataWprowadzenia = dataWprowadzenia;
    }

    public float getCena() {
        return cena;
    }

    public void setCena(float cena) {
        this.cena = cena;
    }

    public Waluta getWaluta() {
        return waluta;
    }

    public void setWaluta(Waluta waluta) {
        this.waluta = waluta;
    }

    public int getKalorycznosc() {
        return kalorycznosc;
    }

    public void setKalorycznosc(int kalorycznosc) {
        this.kalorycznosc = kalorycznosc;
    }
}
