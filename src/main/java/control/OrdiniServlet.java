package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdineBean;
import model.OrdineDAO;
import model.ContenenteBean;
import model.ContenenteDAO;
import model.ProdottoBean;
import model.ProdottoDAO;



@WebServlet("/ordini")
public class OrdiniServlet extends HttpServlet {
    private static final long serialVersionUID = -676741214133898518L;

    public OrdiniServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user is logged in
        String email = (String) request.getSession().getAttribute("email");
        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
        boolean admin = Boolean.TRUE.equals(isAdmin);

        List<String> errors = new ArrayList<>();
        
        if (email.trim().isEmpty() && !admin) {
            errors.add("Il campo email non può essere vuoto!");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            forwardToAppropriatePage(request, response, admin);
            return;
        }

        email = email.trim();
        OrdineDAO ordineDAO = new OrdineDAO();
        ContenenteDAO contenenteDAO = new ContenenteDAO();
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        
        Collection<OrdineBean> ordiniList;
        try {
            if (admin) {
                ordiniList = ordineDAO.doRetrieveAll("IdOrdine");
            } else {
                ordiniList = ordineDAO.doRetrieveByUserKey(email);
            }

            request.getSession().setAttribute("ordini", ordiniList);

            // Recupera tutti i prodotti, inclusi quelli non attivi, solo per la pagina degli ordini
            List<ProdottoBean> tuttiIProdotti = prodottoDAO.doRetrieveAllIncludingInactive();

            for (OrdineBean ordine : ordiniList) {
                int idOrdine = ordine.getIdOrdine();
                List<ContenenteBean> contenenteList = contenenteDAO.doRetrieveByOrderKey(idOrdine);
                request.getSession().setAttribute("contenente" + idOrdine, contenenteList);
                
                for (ContenenteBean contenente : contenenteList) {
                    int idProdotto = contenente.getIdProdotto();
                    ProdottoBean prodotto = tuttiIProdotti.stream()
                        .filter(p -> p.getIdProdotto() == idProdotto)
                        .findFirst()
                        .orElse(null);
                    request.getSession().setAttribute("prodotto" + idProdotto, prodotto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errors.add("Errore nel recupero degli ordini.");
            request.setAttribute("errors", errors);
            forwardToAppropriatePage(request, response, admin);
            return;
        }

        forwardToAppropriatePage(request, response, admin);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void forwardToAppropriatePage(HttpServletRequest request, HttpServletResponse response, boolean admin) throws ServletException, IOException {
        String page = admin ? "ordiniAdmin.jsp" : "ordini.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}
