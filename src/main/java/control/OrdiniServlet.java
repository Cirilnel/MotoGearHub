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
import javax.servlet.http.HttpSession;

import model.OrdineBean;
import model.OrdineDAO;
import model.ContenenteBean;
import model.ContenenteDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.CarrelloBean;
import model.CarrelloDAO;

@WebServlet("/ordini")
public class OrdiniServlet extends HttpServlet {
    private static final long serialVersionUID = -676741214133898518L;

    public OrdiniServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if(request.getSession().getAttribute("email") != null) {
			  RequestDispatcher carrelloDispatcher = request.getRequestDispatcher("/carrello2");
	          carrelloDispatcher.include(request, response);
			}	
        Boolean isAdmin = (Boolean) session.getAttribute("is_admin");
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
        CarrelloDAO carrelloDAO = new CarrelloDAO();
        
        try {
            // Recupera i dati del carrello dal database
            CarrelloBean carrello = carrelloDAO.doRetrieveByUserKey(email);
            if (carrello != null) {
                // Metti il carrello in sessione
                session.setAttribute("carrello", carrello);
            }

            Collection<OrdineBean> ordiniList;
            if (admin) {
                ordiniList = ordineDAO.doRetrieveAll("IdOrdine");
            } else {
                ordiniList = ordineDAO.doRetrieveByUserKey(email);
            }

            session.setAttribute("ordini", ordiniList);

            List<ProdottoBean> tuttiIProdotti = prodottoDAO.doRetrieveAllIncludingInactive();

            for (OrdineBean ordine : ordiniList) {
                int idOrdine = ordine.getIdOrdine();
                List<ContenenteBean> contenenteList = contenenteDAO.doRetrieveByOrderKey(idOrdine);
                session.setAttribute("contenente" + idOrdine, contenenteList);
                
                for (ContenenteBean contenente : contenenteList) {
                    int idProdotto = contenente.getIdProdotto();
                    ProdottoBean prodotto = tuttiIProdotti.stream()
                        .filter(p -> p.getIdProdotto() == idProdotto)
                        .findFirst()
                        .orElse(null);
                    session.setAttribute("prodotto" + idProdotto, prodotto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errors.add("Errore nel recupero dei dati.");
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