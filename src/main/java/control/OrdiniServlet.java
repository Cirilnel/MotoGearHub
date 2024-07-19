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
        RequestDispatcher dispatcherToOrders = request.getRequestDispatcher("ordini.jsp");
       
        // Check if user is logged in
        String email = (String) request.getSession().getAttribute("email");
        if (email == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        List<String> errors = new ArrayList<>();
        
        if (email.trim().isEmpty()) {
            errors.add("Il campo email non può essere vuoto!");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            dispatcherToOrders.forward(request, response);
            return;
        }

        email = email.trim();
        OrdineDAO ordineDAO = new OrdineDAO();
        ContenenteDAO contenenteDAO = new ContenenteDAO();
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        
        List<OrdineBean> ordiniList = (List<OrdineBean>) request.getSession().getAttribute("ordini");
        if (ordiniList == null) {
            try {
                ordiniList = ordineDAO.doRetrieveByUserKey(email);
                request.getSession().setAttribute("ordini", ordiniList);
                
                for (OrdineBean ordine : ordiniList) {
                    int idOrdine = ordine.getIdOrdine();
                    List<ContenenteBean> contenenteList = contenenteDAO.doRetrieveByOrderKey(idOrdine);
                    request.getSession().setAttribute("contenente" + idOrdine, contenenteList);
                    
                    for (ContenenteBean contenente : contenenteList) {
                        int idProdotto = contenente.getIdProdotto();
                        ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(idProdotto);
                        request.getSession().setAttribute("prodotto" + idProdotto, prodotto);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                errors.add("Errore nel recupero degli ordini.");
                request.setAttribute("errors", errors);
                dispatcherToOrders.forward(request, response);
                return;
            }
        }

        request.setAttribute("ordini", ordiniList);
        dispatcherToOrders.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
