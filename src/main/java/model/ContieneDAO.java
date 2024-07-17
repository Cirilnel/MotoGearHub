package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContieneDAO implements BeanDAO<ContieneBean,ContenenteCarrelloCombinedKey> {
    private static final String TABLE_NAME = "contiene";
    
    public ContieneDAO() {
        // Costruttore vuoto
    }
    
    @Override
    public void doSave(ContieneBean data) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME
                + " (IdCarrello, IdProdotto, Quantita) VALUES (?, ?, ?)" +
                "ON DUPLICATE KEY UPDATE quantita = VALUES(Quantita)";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            String idProdotto = data.getIdProdotto() == 0 ? "*" : String.valueOf(data.getIdProdotto());
            String idCarrello = data.getIdCarrello() == 0 ? "*" : String.valueOf(data.getIdCarrello());

            preparedStatement.setString(1, idCarrello);
            preparedStatement.setString(2, idProdotto);
            preparedStatement.setInt(3, data.getQuantita());
            preparedStatement.executeUpdate();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }
    
    @Override
    public boolean doDelete(ContenenteCarrelloCombinedKey key) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE ID_prodotto = ? AND ID_carrello = ?";

        try {
        	connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);

            String idProdotto = key.getIdProdotto() == 0 ? "*" : String.valueOf(key.getIdProdotto());
            String idCarrello = key.getIdCarrello() == 0 ? "*" : String.valueOf(key.getIdCarrello());

            preparedStatement.setString(1, idProdotto);
            preparedStatement.setString(2, idCarrello);

            result = preparedStatement.executeUpdate();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return (result != 0);
    }
    
    @Override
    public ContieneBean doRetrieveByKey(ContenenteCarrelloCombinedKey key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ContieneBean bean = null;


        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdProdotto = ? AND IdCarrello = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            preparedStatement.setInt(1, key.getIdProdotto());
            preparedStatement.setInt(2, key.getIdCarrello());

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bean = new ContieneBean();
                bean.setIdProdotto(rs.getInt("ID_prodotto"));
                bean.setIdCarrello(rs.getInt("ID_Carrello"));
                bean.setQuantita(rs.getInt("quantita"));
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return bean;
    }

    public List<ContieneBean> doRetrieveByCarrelloKey(int key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<ContieneBean> contenenti = new ArrayList<>();

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdCarrello = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            preparedStatement.setInt(1, key);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                ContieneBean bean = null;
                bean = new ContieneBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setQuantita(rs.getInt("Quantita"));
                contenenti.add(bean);
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return contenenti;
    }
    
    @Override
    public List<ContieneBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<ContieneBean> contenenti = new ArrayList<>();

        String selectSQL = "SELECT * FROM " + TABLE_NAME;
        if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                ContieneBean bean = new ContieneBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setQuantita(rs.getInt("Quantita"));

                contenenti.add(bean);
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return contenenti;
    }
}
