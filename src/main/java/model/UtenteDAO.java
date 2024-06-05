package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Utente;
import model.DriverManagerConnectionPool;

public class UtenteDAO {

    private final String INSERT_QUERY = "INSERT INTO Utente (Email, Cognome, Nome, Username, Password, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
    private final String SELECT_ALL_QUERY = "SELECT * FROM Utente";
    private final String SELECT_BY_USERNAME_QUERY = "SELECT * FROM Utente WHERE Username = ?";
    private final String DELETE_QUERY = "DELETE FROM Utente WHERE Username = ?";
    private final String UPDATE_QUERY = "UPDATE Utente SET Email = ?, Cognome = ?, Nome = ?, Password = ?, is_admin = ? WHERE Username = ?";

    public void insert(Utente utente) {
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUERY)) {

            preparedStatement.setString(1, utente.getEmail());
            preparedStatement.setString(2, utente.getCognome());
            preparedStatement.setString(3, utente.getNome());
            preparedStatement.setString(4, utente.getUsername());
            preparedStatement.setString(5, utente.getPassword());
            preparedStatement.setBoolean(6, utente.isAdmin());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Utente> selectAll() {
        List<Utente> utenti = new ArrayList<>();
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_QUERY);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Utente utente = new Utente();
                utente.setIdUtente(resultSet.getInt("IdUtente"));
                utente.setEmail(resultSet.getString("Email"));
                utente.setCognome(resultSet.getString("Cognome"));
                utente.setNome(resultSet.getString("Nome"));
                utente.setUsername(resultSet.getString("Username"));
                utente.setPassword(resultSet.getString("Password"));
                utente.setAdmin(resultSet.getBoolean("is_admin"));
                utenti.add(utente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return utenti;
    }

    // Implementa altri metodi CRUD come update, delete, ecc.
}