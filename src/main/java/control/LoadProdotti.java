package control;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


import model.ProdottoBean;
import model.ProdottoDAO;
import model.UtenteBean;
import model.UtenteDAO;
@WebServlet("/LoadProdotti")
public class LoadProdotti extends HttpServlet{
	private static final long serialVersionUID = -86976045570564505L;

	public LoadProdotti(){
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String mode = request.getParameter("mode");
		RequestDispatcher dispatcherToShop;
		if(mode!=null && mode.equals("home"))
			response.sendRedirect("home.jsp");
		else
			response.sendRedirect("collezione.jsp");
		ProdottoDAO Prodotti = new ProdottoDAO();
		try {
			List<ProdottoBean> ProdottiList = (List<ProdottoBean>) Prodotti.doRetrieveAll("");
			request.getSession().setAttribute("ProdottiList", ProdottiList);
			for(ProdottoBean Prodotto :ProdottiList) {
				int idProdotto = Prodotto.getIdProdotto();
				
			
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return;
	}
		 
		
		

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);	
	}
	
}