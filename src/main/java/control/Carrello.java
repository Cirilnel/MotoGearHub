package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContieneBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContieneDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/carrelloaggiungi")
public class Carrello extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -676741214133898517L;
	
	
	public Carrello() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		RequestDispatcher dispatcherToCart = request.getRequestDispatcher("collezione.jsp");
		if(request.getSession().getAttribute("email")==null) {
			dispatcherToCart.forward(request, response);
			return;
		}
			
		String email = (String) request.getSession().getAttribute("email");
			
		
		List<String> errors = new ArrayList<>();
		
		

		
		if(email == null || email.trim().isEmpty()) {
			errors.add("Il campo username non può essere vuoto!");
		}
		
        if (!errors.isEmpty()) {
        	request.setAttribute("errors", errors);
        	dispatcherToCart.forward(request, response);
        	return;
        }
        
        email = email.trim();
        
        
		
		try {
			CarrelloDAO Carrello = new CarrelloDAO();
	        CarrelloBean CarrelloBean = Carrello.doRetrieveByUserKey(email);
	        if(CarrelloBean == null) {
	        	System.out.println("prova");
	        }
	        //System.out.println("email"+CarrelloBean.getEmail());
			int idCarrello = CarrelloBean.getIdCarrello();
			//System.out.println(idCarrello);
			
			
			
			ContieneDAO Contenente = new ContieneDAO();
			ProdottoDAO Prodotti = new ProdottoDAO();
			
			request.getSession().setAttribute("idCarrello", idCarrello);
		
			List<ContieneBean> ContenenteCarrelloBeanList = (List<ContieneBean>) Contenente.doRetrieveByCarrelloKey(idCarrello);
			request.getSession().setAttribute("ContenenteCarrelloBeanList"+Integer.toString(idCarrello), ContenenteCarrelloBeanList);
			for(ContieneBean ContenenteCarrello :ContenenteCarrelloBeanList) {
				//int quantità = ContenenteCarrello.getQuantita();
				int idProdotto = ContenenteCarrello.getIdProdotto();
				ProdottoBean Prodotto = Prodotti.doRetrieveByKey(String.valueOf(idProdotto));
				//request.getSession().setAttribute(Integer.toString(idCarrello)+Integer.toString(ContenenteCarrello.getIdProdotto()),quantità);
				request.getSession().setAttribute("ProdottoCarrello"+Integer.toString(idProdotto), Prodotto);
				ProdottoBean product = (ProdottoBean) request.getSession().getAttribute("ProdottoCarrello"+idProdotto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
		
		dispatcherToCart.forward(request, response);
		
		
	}
		
		
		

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
}
	