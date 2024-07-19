package control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PneumaticiRedirectServlet")
public class PneumaticiRedirectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PneumaticiRedirectServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Inoltra la richiesta alla servlet carrello2
    	if(request.getSession().getAttribute("email") != null) {
			  RequestDispatcher carrelloDispatcher = request.getRequestDispatcher("/carrello2");
	          carrelloDispatcher.include(request, response);
			}			
   
        // Dopo aver incluso carrello2, effettua un redirect a home.jsp
        response.sendRedirect(request.getContextPath() + "/pneumatici.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
