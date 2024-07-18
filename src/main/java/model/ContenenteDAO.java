package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContenenteDAO implements BeanDAO<ContenenteBean, ContenenteCombinedKey> {
    private static final String TABLE_NAME = "contenente";
    
    @Override
    public synchronized void doSave(ContenenteBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        
        String query = "INSERT INTO " + TABLE_NAME + " (IdProdotto, IdOrdine, PrezzoDiAcquisto, Quantita) VALUES (?, ?, ?, ?)"
                + " ON DUPLICATE KEY UPDATE PrezzoDiAcquisto = VALUES(PrezzoDiAcquisto), quantita = VALUES(Quantita)";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            
            statement.setInt(1, bean.getIdProdotto());
            statement.setInt(2, bean.getIdOrdine());
            statement.setFloat(3, bean.getPrezzoDiAcquisto());
            statement.setInt(4, bean.getQuantita());
            
            statement.executeUpdate();
            
            con.commit();
        } finally {
            DriverManagerConnectionPool.releaseConnection(con);
            if (statement != null) {
                statement.close();
            }
        }
    }

    @Override
    public synchronized boolean doDelete(ContenenteCombinedKey key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        
        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE IdProdotto = ? AND IdOrdine = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(deleteSQL);
            
            statement.setInt(1, key.getIdProdotto());
            statement.setInt(2, key.getIdOrdine());
            
            int result = statement.executeUpdate();
            
            con.commit();
            
            return (result != 0);
        } finally {
            DriverManagerConnectionPool.releaseConnection(con);
            if (statement != null) {
                statement.close();
            }
        }
    }

    @Override
    public ContenenteBean doRetrieveByKey(ContenenteCombinedKey key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdProdotto = ? AND IdOrdine = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            statement.setInt(1, key.getIdProdotto());
            statement.setInt(2, key.getIdOrdine());
            
            rs = statement.executeQuery();
            
            if (rs.next()) {
                ContenenteBean bean = new ContenenteBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdOrdine(rs.getInt("IdOrdine"));
                bean.setPrezzoDiAcquisto(rs.getFloat("PrezzoDiAcquisto"));
                bean.setQuantita(rs.getInt("Quantita"));
                return bean;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            DriverManagerConnectionPool.releaseConnection(con);
        }
        
        return null;
    }

    @Override
    public List<ContenenteBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        List<ContenenteBean> contenenti = new ArrayList<>();
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME;
        if (order != null && !order.isEmpty()) {
            selectSQL += " ORDER BY " + order;
        }
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            rs = statement.executeQuery();
            
            while (rs.next()) {
                ContenenteBean bean = new ContenenteBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdOrdine(rs.getInt("IdOrdine"));
                bean.setPrezzoDiAcquisto(rs.getFloat("PrezzoDiAcquisto"));
                bean.setQuantita(rs.getInt("Quantita"));
                contenenti.add(bean);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            DriverManagerConnectionPool.releaseConnection(con);
        }
        
        return contenenti;
    }

    public List<ContenenteBean> doRetrieveByOrderKey(int key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        List<ContenenteBean> contenenti = new ArrayList<>();
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdOrdine = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            statement.setInt(1, key);
            
            rs = statement.executeQuery();
            
            while (rs.next()) {
                ContenenteBean bean = new ContenenteBean();
                bean.setIdProdotto(rs.getInt("IdProdotto"));
                bean.setIdOrdine(rs.getInt("IdOrdine"));
                bean.setPrezzoDiAcquisto(rs.getFloat("PrezzoDiAcquisto"));
                bean.setQuantita(rs.getInt("Quantita"));
                contenenti.add(bean);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            DriverManagerConnectionPool.releaseConnection(con);
        }
        
        return contenenti;
    }
}
