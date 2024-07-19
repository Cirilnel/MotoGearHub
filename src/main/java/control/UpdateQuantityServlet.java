package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContieneBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContieneDAO;

@WebServlet("/UpdateQuantity")
public class UpdateQuantityServlet extends HttpServlet {

    private static final long serialVersionUID = 6672800554224385658L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
        List<String> errors = new ArrayList<>();
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (email == null || email.trim().isEmpty()) {
            errors.add("Il campo username non può essere vuoto!");
            jsonResponse.put("success", false);
            jsonResponse.put("errors", errors);
            out.print(jsonResponse.toString());
            return;
        }

        email = email.trim();

        try {
            CarrelloDAO carrelli = new CarrelloDAO();
            CarrelloBean carrello = carrelli.doRetrieveByUserKey(email);
            int idCarrello = carrello.getIdCarrello();

            ContieneDAO contenenteCarrelli = new ContieneDAO();
            String idProdotto = request.getParameter("updateProductId");
            ContenenteCarrelloCombinedKey key = new ContenenteCarrelloCombinedKey(Integer.parseInt(idProdotto), idCarrello);
            ContieneBean contenenteCarrello = contenenteCarrelli.doRetrieveByKey(key);

            if (contenenteCarrello == null) {
                // Il prodotto non è presente nel carrello
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Il prodotto non è presente nel carrello.");
                out.print(jsonResponse.toString());
                return;
            }

            int quantityToRemove = Integer.parseInt(request.getParameter("quantityToRemove"));
            int currentQuantity = contenenteCarrello.getQuantita();

            // Sottrai la quantità selezionata dal totale
            int newQuantity = currentQuantity - quantityToRemove;

            if (newQuantity > 0) {
                // Aggiorna la quantità
                contenenteCarrello.setQuantita(newQuantity);
                contenenteCarrelli.doSave(contenenteCarrello);
            } else {
                // Rimuovi l'articolo se la quantità diventa zero o negativa
                contenenteCarrelli.doDelete(key);
            }

            // Aggiorna la sessione
            List<ContieneBean> ContenenteCarrelloBeanList = (List<ContieneBean>) contenenteCarrelli.doRetrieveByCarrelloKey(idCarrello);
            request.getSession().setAttribute("ContenenteCarrelloBeanList"+Integer.toString(idCarrello), ContenenteCarrelloBeanList);
            
            jsonResponse.put("success", true);

        } catch (SQLException e) {
            e.printStackTrace();
            jsonResponse.put("success", false);
            jsonResponse.put("message", "An error occurred while updating the quantity.");
        }

        out.print(jsonResponse.toString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
