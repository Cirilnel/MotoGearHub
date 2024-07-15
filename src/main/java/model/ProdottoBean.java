package model;

public class ProdottoBean {
    private int idProdotto;
    private String marca;
    private int prezzo;
    private int quantitaInMagazzino;
    private String nome;
    private String descrizione;
    private int idCategoria;

    // Getters and Setters
    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(int prezzo) {
        this.prezzo = prezzo;
    }

    public int getQuantitaInMagazzino() {
        return quantitaInMagazzino;
    }

    public void setQuantitaInMagazzino(int quantitaInMagazzino) {
        this.quantitaInMagazzino = quantitaInMagazzino;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
}
