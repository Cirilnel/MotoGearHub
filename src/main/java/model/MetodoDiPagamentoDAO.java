package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MetodoDiPagamentoDAO implements BeanDAO<MetodoDiPagamentoBean, String> {
    private static final String TABLE_NAME = "metodo_di_pagamento";
    // Considerando l'uso di DriverManagerConnectionPool come esempio precedentemente mostrato
    
    @Override
    public synchronized void doSave(MetodoDiPagamentoBean data) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        
        String insertSQL = "INSERT INTO " + TABLE_NAME 
                          + " (email, NCarta, CVV, data) VALUES (?, ?, ?, ?)"
                          + " ON DUPLICATE KEY UPDATE email = VALUES(email), CVV = VALUES(CVV), data = VALUES(data)";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(insertSQL);
            
            statement.setString(1, data.getEmail());
            statement.setString(2, data.getNCarta());
            statement.setString(3, data.getCVV());
            statement.setDate(4, data.getData());
            
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
    public synchronized boolean doDelete(String code) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        
        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE NCarta = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(deleteSQL);
            
            statement.setString(1, code);
            
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
    public synchronized MetodoDiPagamentoBean doRetrieveByKey(String code) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE NCarta = ?";
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            statement.setString(1, code);
            
            rs = statement.executeQuery();
            
            if (rs.next()) {
                MetodoDiPagamentoBean bean = new MetodoDiPagamentoBean();
                bean.setEmail(rs.getString("email"));
                bean.setNCarta(rs.getString("NCarta"));
                bean.setCVV(rs.getString("CVV"));
                bean.setData(rs.getDate("data"));
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

    public synchronized Collection<MetodoDiPagamentoBean> doRetrieveByUserKey(String code) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ?";
        
        Collection<MetodoDiPagamentoBean> metodiDiPagamento = new ArrayList<>();
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            statement.setString(1, code);
            
            rs = statement.executeQuery();
            
            while (rs.next()) {
                MetodoDiPagamentoBean bean = new MetodoDiPagamentoBean();
                bean.setEmail(rs.getString("email"));
                bean.setNCarta(rs.getString("NCarta"));
                bean.setCVV(rs.getString("CVV"));
                bean.setData(rs.getDate("data"));
                metodiDiPagamento.add(bean);
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
        
        return metodiDiPagamento;
    }

    @Override
    public synchronized Collection<MetodoDiPagamentoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        String selectSQL = "SELECT * FROM " + TABLE_NAME;
        if (order != null && !order.isEmpty()) {
            selectSQL += " ORDER BY " + order;
        }
        
        Collection<MetodoDiPagamentoBean> metodiDiPagamento = new ArrayList<>();
        
        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(selectSQL);
            
            rs = statement.executeQuery();
            
            while (rs.next()) {
                MetodoDiPagamentoBean bean = new MetodoDiPagamentoBean();
                bean.setEmail(rs.getString("email"));
                bean.setNCarta(rs.getString("NCarta"));
                bean.setCVV(rs.getString("CVV"));
                bean.setData(rs.getDate("data"));
                metodiDiPagamento.add(bean);
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
        
        return metodiDiPagamento;
    }
}
