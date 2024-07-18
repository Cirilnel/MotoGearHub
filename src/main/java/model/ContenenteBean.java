package model;

import java.io.Serializable;

public class ContenenteBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934260L;
    
    private int IdProdotto;
    private int IdOrdine;
    private float PrezzoDiAcquisto;
    private int Quantita;
    
    public ContenenteBean() {
        this.IdProdotto = -1;
        this.IdOrdine = -1;
        this.PrezzoDiAcquisto = 0.0f;
        this.Quantita = 0;
    }
    
    public ContenenteBean(int idProdotto, int idOrdine, float prezzoAllAcquisto, int quantita) {
        this.IdProdotto = idProdotto;
        this.IdOrdine = idOrdine;
        this.PrezzoDiAcquisto = prezzoAllAcquisto;
        this.Quantita = quantita;
    }

    // Getters and Setters
    public int getIdProdotto() {
        return IdProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.IdProdotto = idProdotto;
    }

    public int getIdOrdine() {
        return IdOrdine;
    }

    public void setIdOrdine(int idOrdine) {
        this.IdOrdine = idOrdine;
    }

    public float getPrezzoDiAcquisto() {
        return PrezzoDiAcquisto;
    }

    public void setPrezzoDiAcquisto(float prezzoAllAcquisto) {
        this.PrezzoDiAcquisto = prezzoAllAcquisto;
    }

    public int getQuantita() {
        return Quantita;
    }

    public void setQuantita(int quantita) {
        this.Quantita = quantita;
    }
}