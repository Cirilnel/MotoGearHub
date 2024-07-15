package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO extends AbstractDAO<ProdottoBean>{
	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized void doSave(ProdottoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + ProdottoDAO.TABLE_NAME + " (IdProdotto, marca, prezzo, quantitainmagazzino, nome, descrizione, idcategoria) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getIdProdotto());
			statement.setString(2, bean.getMarca());
			statement.setInt(3, bean.getPrezzo());
			statement.setInt(4, bean.getQuantitaInMagazzino());
			statement.setString(5, bean.getNome());
			statement.setString(6, bean.getDescrizione());
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
	public synchronized boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE idProdotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			result = statement.executeUpdate();
			
			con.commit(); // togliere commento se vuoi cancellare davvero dal db ad ogni delete
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return result != 0;
	}
	
	@Override
	public synchronized ProdottoBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		ProdottoBean prodotto = new ProdottoBean();
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE id = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				prodotto.setIdProdotto(result.getInt("IdProdotto"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setPrezzo(result.getInt("prezzo"));
				prodotto.setQuantitaInMagazzino(result.getInt("quantitainmagazzino"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setDescrizione(result.getString("descrizione"));
				prodotto.setIdCategoria(result.getInt("IdCategoria"));
			}
		} finally {
			try {
				if(statement != null) {
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
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setIdProdotto(result.getInt("IdProdotto"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setPrezzo(result.getInt("prezzo"));
				prodotto.setQuantitaInMagazzino(result.getInt("quantitainmagazzino"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setDescrizione(result.getString("descrizione"));
				prodotto.setIdCategoria(result.getInt("IdCategoria"));
				
				prodotti.add(prodotto);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return prodotti;
	}
	
	@Override
	public synchronized boolean doUpdate(ProdottoBean bean) throws SQLException {
	    Connection con = null;
	    PreparedStatement statement = null;
	    int result = 0;

	    String query = "UPDATE " + ProdottoDAO.TABLE_NAME + " SET nome = ?, descrizione = ?, quantita = ?, costo = ?, sesso = ?, immagine = ?, categoriaNome = ? WHERE id = ?";

	    try {
	        con = DriverManagerConnectionPool.getConnection();
	        statement = con.prepareStatement(query);

	        statement.setInt(1, bean.getIdProdotto());
			statement.setString(2, bean.getMarca());
			statement.setInt(3, bean.getPrezzo());
			statement.setInt(4, bean.getQuantitaInMagazzino());
			statement.setString(5, bean.getNome());
			statement.setString(6, bean.getDescrizione());
			statement.setInt(7, bean.getIdCategoria());

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
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE nome LIKE ? OR categoria LIKE ? OR sesso LIKE ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, ("%" + search + "%"));
			statement.setString(2, ("%" + search + "%"));
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setIdProdotto(result.getInt("IdProdotto"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setPrezzo(result.getInt("prezzo"));
				prodotto.setQuantitaInMagazzino(result.getInt("quantitainmagazzino"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setDescrizione(result.getString("descrizione"));
				prodotto.setIdCategoria(result.getInt("IdCategoria"));
				
				prodottiTrovati.add(prodotto);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}	
		return prodottiTrovati;
	}
	
	public synchronized ArrayList<ProdottoBean> doRetrieveByCategoria(String categoria) throws SQLException{
		ArrayList<ProdottoBean> prodotti = new ArrayList<>();
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE categoria = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, categoria);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setIdProdotto(result.getInt("IdProdotto"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setPrezzo(result.getInt("prezzo"));
				prodotto.setQuantitaInMagazzino(result.getInt("quantitainmagazzino"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setDescrizione(result.getString("descrizione"));
				prodotto.setIdCategoria(result.getInt("IdCategoria"));
				
				prodotti.add(prodotto);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return prodotti;
	}
}