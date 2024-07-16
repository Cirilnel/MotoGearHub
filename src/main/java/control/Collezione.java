package control;

import model.ProdottoBean;
import model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

@WebServlet("/collezione")
public class Collezione extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Collezione() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcherToShop = request.getRequestDispatcher("collezione.jsp");
		ProdottoDAO Prodotti = new ProdottoDAO();
		
		try {
			List<ProdottoBean> ProdottiList = (List<ProdottoBean>) Prodotti.doRetrieveAll("");
			request.getSession().setAttribute("ProdottiList", ProdottiList);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		dispatcherToShop.forward(request, response);
	}
		 
		
		

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);	
	}
}