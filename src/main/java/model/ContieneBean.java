package model;

import java.io.Serializable;

public class ContieneBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934257L;
    
    private int IdCarrello;
    private int IdProdotto;
    private int Quantita;
    
    public ContieneBean() {
        this.IdCarrello = -1;//non specificato
        this.IdProdotto = -1;//non specificato
        this.Quantita = 0;
    }
    
    public ContieneBean(int idCarrello, int idProdotto, int quantita) {
        this.IdCarrello = idCarrello;
        this.IdProdotto = idProdotto;
        this.Quantita = quantita;
    }

    // Getters and Setters
    public int getIdCarrello() {
        return IdCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.IdCarrello = idCarrello;
    }

    public int getIdProdotto() {
        return IdProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.IdProdotto = idProdotto;
    }

    public int getQuantita() {
        return Quantita;
    }

    public void setQuantita(int quantita) {
        this.Quantita = quantita;
    }
}