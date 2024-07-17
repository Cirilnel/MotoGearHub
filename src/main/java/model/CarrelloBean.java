package model;

import java.math.BigDecimal;

public class CarrelloBean {

    private int idCarrello;
    private BigDecimal totale;
    private int numeroDiProdotti;
    private String emailUtente;

    // Costruttori, getter e setter

    public CarrelloBean() {
    }

    public CarrelloBean(int idCarrello, BigDecimal totale, int numeroDiProdotti, String emailUtente) {
        this.idCarrello = idCarrello;
        this.totale = totale;
        this.numeroDiProdotti = numeroDiProdotti;
        this.emailUtente = emailUtente;
    }

    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.idCarrello = idCarrello;
    }

    public BigDecimal getTotale() {
        return totale;
    }

    public void setTotale(BigDecimal totale) {
        this.totale = totale;
    }

    public int getNumeroDiProdotti() {
        return numeroDiProdotti;
    }

    public void setNumeroDiProdotti(int numeroDiProdotti) {
        this.numeroDiProdotti = numeroDiProdotti;
    }

    public String getEmailUtente() {
        return emailUtente;
    }

    public void setEmailUtente(String emailUtente) {
        this.emailUtente = emailUtente;
    }

}
