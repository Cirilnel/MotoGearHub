package model;

import java.io.Serializable;

public class UserBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934254L;
    
    public UserBean() {
        email = "";
        nome = "";
        cognome = "";
        username = "";
        password = ""; 
        idUtente = 0;
        isAdmin = false;
    }
    
    public void setEmail(String newEmail) {
        email = newEmail;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setNome(String newNome) {
        nome = newNome;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setCognome(String newCognome) {
        cognome = newCognome;
    }
    
    public String getCognome() {
        return cognome;
    }
    
    public void setPassword(String newPassword) {
        password = newPassword;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setUsername(String newUsername) {
        username = newUsername;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setNumero(String newNumero) {
        numero = newNumero;
    }
    
    public String getNumero() {
        return numero;
    }
    
    public void setAdmin(boolean newIsAdmin) {
        isAdmin = newIsAdmin;
    }
    
    public boolean isAdmin() {
        return isAdmin;
    }
    
    public void setIdUtente(int newIdUtente) {
        idUtente = newIdUtente;
    }
    
    public int getIdUtente() {
        return idUtente;
    }

    private String email;
    private String nome;
    private String cognome;
    private String password;
    private String username;
    private String numero;
    private boolean isAdmin;
    private int idUtente;
}
