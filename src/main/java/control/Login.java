package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/Login.do")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("usernameLogin");
        Encoder encoder = Base64.getEncoder();
        String password64 = encoder.encodeToString(request.getParameter("passwordLogin").getBytes());
        UtenteBean user = checkLogin(username, password64);

        if (user != null) {
            request.getSession().setAttribute("nome", user.getNome());
            request.getSession().setAttribute("cognome", user.getCognome());
            request.getSession().setAttribute("utente", user.getUsername());
            request.getSession().setAttribute("email", user.getEmail());
            request.getSession().setAttribute("logged", true);

            // Avvia la servlet CarrelloServlet2
            RequestDispatcher carrelloDispatcher = request.getRequestDispatcher("/carrello2");
            carrelloDispatcher.include(request, response);

            if (user.isAdmin()) {
                request.getSession().setAttribute("is_admin", true);
                response.sendRedirect("adminArea.jsp");
            } else {
                request.getSession().setAttribute("is_admin", false);
                response.sendRedirect("memberArea.jsp");
            }
        } else {
            request.getSession().setAttribute("logged", false);
            request.getSession().setAttribute("error", "Username e/o password invalidi.");
            response.sendRedirect("login.jsp?action=error");
        }
    }

    private UtenteBean checkLogin(String username, String password64) {
        UtenteDAO database = new UtenteDAO();
        UtenteBean user = new UtenteBean();

        try {
            user = database.doRetrieveByUsername(username);

            if (user.getUsername().equals(username) && user.getPassword().equals(password64)) {
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
