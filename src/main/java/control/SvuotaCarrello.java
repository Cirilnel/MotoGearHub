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
import javax.sql.DataSource;

import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContieneBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContieneDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UtenteBean;


@WebServlet("/SvuotaCarrello")
public class SvuotaCarrello extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6672800554224385658L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		String email = (String) request.getSession().getAttribute("email");
		
		
		List<String> errors = new ArrayList<>();
		
		RequestDispatcher dispatcherToCart = request.getRequestDispatcher("carrello.jsp");

		
		if(email == null || email.trim().isEmpty()) {
			errors.add("Il campo username non può essere vuoto!");
		}
		
        if (!errors.isEmpty()) {
        	request.setAttribute("errors", errors);
        	dispatcherToCart.forward(request, response);
        	return;
        }
        
        email = email.trim();
        
        try{
        	CarrelloDAO carrelli = new CarrelloDAO();
        	
        	CarrelloBean carrello = carrelli.doRetrieveByUserKey(email);
        	
        	int idCarrello = carrello.getIdCarrello();
        	
        	ContieneDAO ContenenteCarrelli = new ContieneDAO();
        	
        	List<ContieneBean> ContenenteCarrelloList = (List<ContieneBean>) ContenenteCarrelli.doRetrieveByCarrelloKey(idCarrello);
        	
        	for(ContieneBean ContenenteCarrello: ContenenteCarrelloList) {
        		int idProdotto = ContenenteCarrello.getIdProdotto();
        		ContenenteCarrelloCombinedKey key = new ContenenteCarrelloCombinedKey(idProdotto,idCarrello);
            	ContenenteCarrelli.doDelete(key);
            	request.getSession().removeAttribute("ProdottoCarrello"+Integer.toString(idProdotto));
            	request.getSession().removeAttribute("Prodottoimmagini"+Integer.toString(idProdotto));
        	}
        	request.getSession().removeAttribute("ContenenteCarrelloBeanList"+Integer.toString(idCarrello));
        	
        	
        }catch (SQLException e) {
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