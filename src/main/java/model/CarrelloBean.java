package model;
public class CarrelloBean {
    private int idCarrello;
    private double totale;
    private int numeroDiProdotti;
    private String emailUtente;

    // Costruttore vuoto
    public CarrelloBean() {}

    // Costruttore con tutti i campi
    public CarrelloBean(int idCarrello, double totale, int numeroDiProdotti, String emailUtente) {
        this.idCarrello = idCarrello;
        this.totale = totale;
        this.numeroDiProdotti = numeroDiProdotti;
        this.emailUtente = emailUtente;
    }

    // Getter e Setter
    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.idCarrello = idCarrello;
    }

    public double getTotale() {
        return totale;
    }

    public void setTotale(double totale) {
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

    @Override
    public String toString() {
        return "Carrello{" +
                "idCarrello=" + idCarrello +
                ", totale=" + totale +
                ", numeroDiProdotti=" + numeroDiProdotti +
                ", emailUtente='" + emailUtente + '\'' +
                '}';
    }
}
