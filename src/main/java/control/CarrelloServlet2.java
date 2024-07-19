package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet("/carrello2")
public class CarrelloServlet2 extends HttpServlet {
    private static final long serialVersionUID = -676741214133898517L;

    public CarrelloServlet2() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Inizializza la lista degli errori
        List<String> errors = new ArrayList<>();

        // Controlla se l'utente è loggato
        if (request.getSession().getAttribute("email") == null) {
            // Non loggato, invia un errore o una risposta di accesso negato
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Utente non autenticato");
            return;
        }

        String email = (String) request.getSession().getAttribute("email");

        if (email == null || email.trim().isEmpty()) {
            errors.add("Il campo username non può essere vuoto!");
        }

        if (!errors.isEmpty()) {
            // Se ci sono errori, puoi inviarli al client in un formato JSON o HTML
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"errors\": " + errors.toString() + "}");
            return;
        }

        email = email.trim();

        try {
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            CarrelloBean carrelloBean = carrelloDAO.doRetrieveByUserKey(email);
            if (carrelloBean == null) {
                // Carrello non trovato, puoi inviare un errore o una risposta adeguata
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Carrello non trovato");
                return;
            }

            int idCarrello = carrelloBean.getIdCarrello();

            ContieneDAO contieneDAO = new ContieneDAO();
            ProdottoDAO prodottoDAO = new ProdottoDAO();

            // Imposta i dati nella sessione
            request.getSession().setAttribute("idCarrello", idCarrello);
            List<ContieneBean> contieneCarrelloBeanList = contieneDAO.doRetrieveByCarrelloKey(idCarrello);
            request.getSession().setAttribute("contieneCarrelloBeanList" + idCarrello, contieneCarrelloBeanList);

            for (ContieneBean contieneCarrello : contieneCarrelloBeanList) {
                int idProdotto = contieneCarrello.getIdProdotto();
                ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(idProdotto);
                request.getSession().setAttribute("prodottoCarrello" + idProdotto, prodotto);
            }

            // Invia una risposta di successo o altri dati necessari
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\": \"success\", \"message\": \"Carrello aggiornato\"}");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}