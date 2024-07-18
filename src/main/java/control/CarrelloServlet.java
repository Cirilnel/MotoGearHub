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

import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContieneBean;
import model.ContieneDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UtenteBean;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {
    private static final long serialVersionUID = -676741214133898517L;

    public CarrelloServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       

        RequestDispatcher dispatcherToCart = request.getRequestDispatcher("carrello.jsp");
        if (request.getSession().getAttribute("email") == null) {
            dispatcherToCart.forward(request, response);
            return;
        }

        String email =(String) request.getSession().getAttribute("email");
        List<String> errors = new ArrayList<>();

        if (email == null || email.trim().isEmpty()) {
            errors.add("Il campo username non può essere vuoto!");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            dispatcherToCart.forward(request, response);
            return;
        }

        email = email.trim();

        try {
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            CarrelloBean carrelloBean = carrelloDAO.doRetrieveByUserKey(email);
            if (carrelloBean == null) {
                System.out.println("Carrello non trovato");
                dispatcherToCart.forward(request, response);
                return;
            }

            int idCarrello = carrelloBean.getIdCarrello();

            ContieneDAO contieneDAO = new ContieneDAO();
            ProdottoDAO prodottoDAO = new ProdottoDAO();

            request.getSession().setAttribute("idCarrello", idCarrello);
            List<ContieneBean> contieneCarrelloBeanList = contieneDAO.doRetrieveByCarrelloKey(idCarrello);
            request.getSession().setAttribute("contieneCarrelloBeanList" + idCarrello, contieneCarrelloBeanList);

            for (ContieneBean contieneCarrello : contieneCarrelloBeanList) {
                int idProdotto = contieneCarrello.getIdProdotto();
                ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(idProdotto);
                System.out.println(idProdotto);
                request.getSession().setAttribute("prodottoCarrello" + idProdotto, prodotto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        dispatcherToCart.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
