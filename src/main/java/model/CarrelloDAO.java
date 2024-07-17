package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarrelloDAO implements BeanDAO<CarrelloBean,Integer> {
    private static String TABLE_NAME = "Carrello";

    @Override
    public void doSave(CarrelloBean data) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + CarrelloDAO.TABLE_NAME
                + " (IdCarrello, Totale, NumeroDiProdotti, EmailUtente) VALUES (?, ?, ?, ?)";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setInt(1, data.getIdCarrello());
            preparedStatement.setBigDecimal(2, data.getTotale());
            preparedStatement.setInt(3, data.getNumeroDiProdotti());
            preparedStatement.setString(4, data.getEmailUtente());

            preparedStatement.executeUpdate();

            connection.commit();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public boolean doDelete(Integer Key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + CarrelloDAO.TABLE_NAME + " WHERE IdCarrello = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, Key);

            result = preparedStatement.executeUpdate();

            connection.commit();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return (result != 0);
    }

    @Override
    public CarrelloBean doRetrieveByKey(Integer Key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        CarrelloBean bean = new CarrelloBean();

        String selectSQL = "SELECT * FROM " + CarrelloDAO.TABLE_NAME + " WHERE IdCarrello = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, Key);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setTotale(rs.getBigDecimal("Totale"));
                bean.setNumeroDiProdotti(rs.getInt("NumeroDiProdotti"));
                bean.setEmailUtente(rs.getString("EmailUtente"));
            }

        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return bean;
    }

    public CarrelloBean doRetrieveByUserKey(String emailUtente) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        CarrelloBean bean = new CarrelloBean();

        String selectSQL = "SELECT * FROM " + CarrelloDAO.TABLE_NAME + " WHERE EmailUtente = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, emailUtente);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setTotale(rs.getBigDecimal("Totale"));
                bean.setNumeroDiProdotti(rs.getInt("NumeroDiProdotti"));
                bean.setEmailUtente(rs.getString("EmailUtente"));
            }

        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return bean;
    }

    @Override
    public List<CarrelloBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<CarrelloBean> carrelli = new ArrayList<CarrelloBean>();
        String selectSQL = "SELECT * FROM " + CarrelloDAO.TABLE_NAME;
        if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }
        CarrelloBean bean = null;
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                bean = new CarrelloBean();
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setTotale(rs.getBigDecimal("Totale"));
                bean.setNumeroDiProdotti(rs.getInt("NumeroDiProdotti"));
                bean.setEmailUtente(rs.getString("EmailUtente"));

                carrelli.add(bean);
            }
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return carrelli;
    }
}
