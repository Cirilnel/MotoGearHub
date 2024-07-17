package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContieneDAO extends AbstractDAO<ContieneBean> {
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
    public synchronized boolean doDelete(String key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        int result = 0;
        String query = "DELETE FROM " + ContieneDAO.TABLE_NAME + " WHERE nome = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, key);

            result = statement.executeUpdate();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return result != 0;
    }
    
    @Override
    public ContieneBean doRetrieveByKey(String key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ContieneBean bean = null;

        String[] parts = key.split("-");
        int idProdotto = Integer.parseInt(parts[0]);
        int idCarrello = Integer.parseInt(parts[1]);

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdProdotto = ? AND IdCarrello = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, idProdotto);
            preparedStatement.setInt(2, idCarrello);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                bean = new ContieneBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setQuantita(rs.getInt("Quantita"));
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
