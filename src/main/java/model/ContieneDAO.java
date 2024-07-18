package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ContieneDAO implements BeanDAO<ContieneBean, ContenenteCarrelloCombinedKey> {
    private static final String TABLE_NAME = "contiene";
    
    @Override
    public synchronized void doSave(ContieneBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + ContieneDAO.TABLE_NAME + " (IdCarrello, IdProdotto, Quantita) VALUES (?, ?, ?)"+ "ON DUPLICATE KEY UPDATE Quantita = VALUES(Quantita)";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			 statement.setInt(1, bean.getIdCarrello());
	         statement.setInt(2, bean.getIdProdotto());
	         statement.setInt(3, bean.getQuantita());
			
			statement.executeUpdate();
			
			con.commit();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	
	}


    
    @Override
    public synchronized boolean doDelete(ContenenteCarrelloCombinedKey key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        
        String deleteSQL = "DELETE FROM " + ContieneDAO.TABLE_NAME + " WHERE IdProdotto = ? AND IdCarrello = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(deleteSQL);
            
            statement.setInt(1, key.getIdProdotto());
            statement.setInt(2, key.getIdCarrello());
            
            int result = statement.executeUpdate();
            
            con.commit();
            
            return (result != 0);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }
    }

    
    @Override
    public ContieneBean doRetrieveByKey(ContenenteCarrelloCombinedKey key) throws SQLException {
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdProdotto = ? AND IdCarrello = ?";
      
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectSQL)) {

            preparedStatement.setInt(1, key.getIdProdotto());
            preparedStatement.setInt(2, key.getIdCarrello());

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    ContieneBean bean = new ContieneBean();
                    bean.setIdProdotto(rs.getInt("IdProdotto"));
                    bean.setIdCarrello(rs.getInt("IdCarrello"));
                    bean.setQuantita(rs.getInt("Quantita"));
                    return bean;
                }
            }
        }
        return null;
    }

    public List<ContieneBean> doRetrieveByCarrelloKey(int key) throws SQLException {
        List<ContieneBean> contenenti = new ArrayList<>();
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdCarrello = ?";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectSQL)) {

            preparedStatement.setInt(1, key);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    ContieneBean bean = new ContieneBean();
                    bean.setIdProdotto(rs.getInt("IdProdotto"));
                    bean.setIdCarrello(rs.getInt("IdCarrello"));
                    bean.setQuantita(rs.getInt("Quantita"));
                    contenenti.add(bean);
                }
            }
        }
        return contenenti;
    }
    
    @Override
    public List<ContieneBean> doRetrieveAll(String order) throws SQLException {
        List<ContieneBean> contenenti = new ArrayList<>();
        String selectSQL = "SELECT * FROM " + TABLE_NAME;
        if (order != null && !order.isEmpty()) {
            selectSQL += " ORDER BY " + order;
        }

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                ContieneBean bean = new ContieneBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdCarrello(rs.getInt("IdCarrello"));
                bean.setQuantita(rs.getInt("Quantita"));
                contenenti.add(bean);
            }
        }
        return contenenti;
    }
}
