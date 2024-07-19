package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/LoadProdotti")
public class LoadProdotti extends HttpServlet {
    private static final long serialVersionUID = -86976045570564505L;

    public LoadProdotti() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        
        try {
            // Recupera la lista dei prodotti e memorizzala nella sessione
            List<ProdottoBean> prodottiList = prodottoDAO.doRetrieveAll("");
            request.getSession().setAttribute("ProdottiList", prodottiList);
            
            // Verifica se l'utente è un admin dopo aver recuperato i prodotti
            Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
            if (isAdmin != null && isAdmin) {
                // Se l'utente è un admin, reindirizza alla pagina di amministrazione
                response.sendRedirect("Collezioneadmin.jsp");
            } else {
                // Se l'utente non è un admin, reindirizza alla pagina corretta in base al parametro mode
                if (mode != null && mode.equals("home")) {
                    response.sendRedirect("home.jsp");
                } else {
                    response.sendRedirect("collezione.jsp");
                }
            }
        } catch (Exception e) {
            // Gestisci l'eccezione
            e.printStackTrace();
            // Potresti anche voler reindirizzare a una pagina di errore o loggare l'errore
            response.sendRedirect("error.jsp"); // Puoi sostituire "error.jsp" con la tua pagina di errore
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
