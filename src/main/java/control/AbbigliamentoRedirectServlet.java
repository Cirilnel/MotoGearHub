package control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AbbigliamentoRedirectServlet")
public class AbbigliamentoRedirectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AbbigliamentoRedirectServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in
        if (request.getSession().getAttribute("email") != null) {
            // Include the carrello2 servlet
            RequestDispatcher carrelloDispatcher = request.getRequestDispatcher("/carrello2");
            carrelloDispatcher.include(request, response);
        }

        // Check if the user is an admin
        Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
        if (Boolean.TRUE.equals(isAdmin)) {
            // Redirect to abbigliamentoAdmin.jsp if user is an admin
            response.sendRedirect(request.getContextPath() + "/abbigliamentoAdmin.jsp");
        } else {
            // Redirect to abbigliamento.jsp if user is not an admin
            response.sendRedirect(request.getContextPath() + "/abbigliamento.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
