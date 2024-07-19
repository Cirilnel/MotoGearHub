package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO implements BeanDAO<ProdottoBean,Integer> {
    private static final String TABLE_NAME = "prodotto";

    @Override
    public synchronized void doSave(ProdottoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        String query = "INSERT INTO " + ProdottoDAO.TABLE_NAME + " (IdProdotto, marca, prezzo, nome, descrizione, image, idcategoria) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            statement.setInt(1, bean.getIdProdotto());
            statement.setString(2, bean.getMarca());
            statement.setInt(3, bean.getPrezzo());
            statement.setString(4, bean.getNome());
            statement.setString(5, bean.getDescrizione());
            statement.setString(6, bean.getImage());
            statement.setInt(7, bean.getIdCategoria());
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
    public synchronized boolean doDelete(Integer key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        int result = 0;
        String query = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE IdProdotto = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setInt(1, key);

            result = statement.executeUpdate();

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

        return result != 0;
    }

    @Override
    public synchronized ProdottoBean doRetrieveByKey(Integer key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ProdottoBean prodotto = new ProdottoBean();

        String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE IdProdotto = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setInt(1, key);

            ResultSet result = statement.executeQuery();

            while (result.next()) {
                prodotto.setIdProdotto(result.getInt("IdProdotto"));
                prodotto.setMarca(result.getString("marca"));
                prodotto.setImage(result.getString("image"));
                prodotto.setPrezzo(result.getInt("prezzo"));
                prodotto.setNome(result.getString("nome"));
                prodotto.setDescrizione(result.getString("descrizione"));
                prodotto.setIdCategoria(result.getInt("idcategoria"));
            }
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return prodotto;
    }

    @Override
    public synchronized List<ProdottoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        List<ProdottoBean> prodotti = new ArrayList<>();

        String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME;

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            ResultSet result = statement.executeQuery();

            while (result.next()) {
                ProdottoBean prodotto = new ProdottoBean();

                prodotto.setIdProdotto(result.getInt("IdProdotto"));
                prodotto.setMarca(result.getString("marca"));
                prodotto.setImage(result.getString("image"));
                prodotto.setPrezzo(result.getInt("prezzo"));
                prodotto.setNome(result.getString("nome"));
                prodotto.setDescrizione(result.getString("descrizione"));
                prodotto.setIdCategoria(result.getInt("idcategoria"));

                prodotti.add(prodotto);
            }
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return prodotti;
    }

    public synchronized boolean doUpdate(ProdottoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        int result = 0;

        String query = "UPDATE " + ProdottoDAO.TABLE_NAME + " SET marca = ?, prezzo = ?, nome = ?, descrizione = ?, image = ?, idcategoria = ? WHERE IdProdotto = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            statement.setString(1, bean.getMarca());
            statement.setInt(2, bean.getPrezzo());
            statement.setString(3, bean.getNome());
            statement.setString(4, bean.getDescrizione());
            statement.setString(5, bean.getImage());
            statement.setInt(6, bean.getIdCategoria());
            statement.setInt(7, bean.getIdProdotto());

            result = statement.executeUpdate();

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

        return result != 0;
    }

    public synchronized List<ProdottoBean> searchBy(String search) throws SQLException {
        List<ProdottoBean> prodottiTrovati = new ArrayList<>();
        Connection con = null;
        PreparedStatement statement = null;

        String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE nome LIKE ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, "%" + search + "%");

            ResultSet result = statement.executeQuery();

            while (result.next()) {
                ProdottoBean prodotto = new ProdottoBean();

                prodotto.setIdProdotto(result.getInt("IdProdotto"));
                prodotto.setMarca(result.getString("marca"));
                prodotto.setImage(result.getString("image"));
                prodotto.setPrezzo(result.getInt("prezzo"));
                prodotto.setNome(result.getString("nome"));
                prodotto.setDescrizione(result.getString("descrizione"));
                prodotto.setIdCategoria(result.getInt("idcategoria"));

                prodottiTrovati.add(prodotto);
            }
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }
        return prodottiTrovati;
    }

    public synchronized ArrayList<ProdottoBean> doRetrieveByCategoria(String categoria) throws SQLException {
        ArrayList<ProdottoBean> prodotti = new ArrayList<>();
        Connection con = null;
        PreparedStatement statement = null;

        String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE idcategoria = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, categoria);

            ResultSet result = statement.executeQuery();

            while (result.next()) {
                ProdottoBean prodotto = new ProdottoBean();

                prodotto.setIdProdotto(result.getInt("IdProdotto"));
                prodotto.setMarca(result.getString("marca"));
                prodotto.setImage(result.getString("image"));
                prodotto.setPrezzo(result.getInt("prezzo"));
                prodotto.setNome(result.getString("nome"));
                prodotto.setDescrizione(result.getString("descrizione"));
                prodotto.setIdCategoria(result.getInt("idcategoria"));

                prodotti.add(prodotto);
            }
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return prodotti;
    }
    public synchronized int nextId() throws SQLException{
    	String selectSQL = "SELECT COUNT(*) AS numero_prodotti FROM prodotto"
    			+ "";
    	Connection con = null;
        PreparedStatement statement = null;
    	int nextAutoIncrementValue = 0;

    	try{
    		 con = DriverManagerConnectionPool.getConnection();
	   	    PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
	   	    ResultSet rs = preparedStatement.executeQuery();

    	    if (rs.next()) {
    	        nextAutoIncrementValue = rs.getInt("numero_prodotti")+1;
    	    }
    	    preparedStatement.close();
    	    con.close();
    	}catch(SQLException e) {
    		
    	    e.printStackTrace(); // Gestione dell'eccezione SQL, puoi gestirla in modo più appropriato nel tuo caso
    	}
    	

    	return nextAutoIncrementValue;
    }
    public synchronized void updateProdotto(ProdottoBean prodotto) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String updateSQL = "UPDATE " + ProdottoDAO.TABLE_NAME + " SET nome = ?, marca = ?, descrizione = ?, prezzo = ?, image = ? WHERE IdProdotto = ?";

        try {
            // Ottieni la connessione dal pool
            conn = DriverManagerConnectionPool.getConnection();

            // Disabilita l'auto-commit per gestire manualmente la transazione
            conn.setAutoCommit(false);

            // Prepara la query SQL
            pstmt = conn.prepareStatement(updateSQL);

            // Imposta i parametri della query
            pstmt.setString(1, prodotto.getNome());
            pstmt.setString(2, prodotto.getMarca());
            pstmt.setString(3, prodotto.getDescrizione());
            pstmt.setDouble(4, prodotto.getPrezzo());
            pstmt.setString(5, prodotto.getImage());
            pstmt.setInt(6, prodotto.getIdProdotto());
            System.out.println("qui ci arrivo");
            // Esegui l'aggiornamento
            pstmt.executeUpdate();

            // Effettua il commit della transazione
            conn.commit();
        } catch (SQLException e) {
            // Rollback in caso di errore
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            throw e; // Propaga l'eccezione per gestirla a un livello superiore
        } finally {
            // Chiudi il PreparedStatement
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Rilascia la connessione al pool
                DriverManagerConnectionPool.releaseConnection(conn);
            }
        }
    }


}
