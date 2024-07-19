package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/RimozioneAdmin")
public class RimozioneAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RimozioneAdmin() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        
        try {
            // Recupera la lista dei prodotti dal database
            List<ProdottoBean> prodottiList = prodottoDAO.doRetrieveAll("");
            // Memorizza la lista dei prodotti nella sessione
            request.getSession().setAttribute("ProdottiList", prodottiList);
            
            // Verifica se l'utente è un admin
            Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
            if (isAdmin != null && isAdmin) {
                // Se l'utente è un admin, reindirizza alla pagina di rimozione
                response.sendRedirect("rimozione.jsp");
            } else {
                // Se l'utente non è un admin, reindirizza alla pagina di errore o login
                response.sendRedirect("error.jsp"); // Puoi modificare questo con la tua pagina di errore o login
            }
        } catch (Exception e) {
            // Gestisce eventuali eccezioni
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Puoi sostituire "error.jsp" con la tua pagina di errore
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
