package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CarrelloDAO;
import model.ContieneBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContieneDAO;

import org.json.JSONObject;

@WebServlet("/carrelloaggiungi")
public class Carrello extends HttpServlet {
    private static final long serialVersionUID = 7112366996429439147L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        int quantity;
        String idProdotto = request.getParameter("AddProdottoId");
         
        if(request.getParameter("quantity")==null) 
        	 quantity=1;
        else
        	quantity = Integer.parseInt(request.getParameter("quantity"));
    
        if (request.getSession().getAttribute("email") == null) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "User not logged in");
            out.print(jsonResponse);
            return;
        }
        
        String email = (String) request.getSession().getAttribute("email");
        CarrelloDAO carrelli = new CarrelloDAO();
        ContieneDAO contenenteCarrelli = new ContieneDAO();
     
        try {
            int idCarrello = carrelli.doRetrieveByUserKey(email).getIdCarrello();
            ContenenteCarrelloCombinedKey key = new ContenenteCarrelloCombinedKey(Integer.parseInt(idProdotto), idCarrello);
            ContieneBean contenenteCarrello = contenenteCarrelli.doRetrieveByKey(key);
            
           
            if (contenenteCarrello == null) {
                ContieneBean newContenenteCarrello = new ContieneBean(idCarrello, Integer.parseInt(idProdotto), quantity);
                contenenteCarrelli.doSave(newContenenteCarrello);
            } else {
                contenenteCarrello.setQuantita(contenenteCarrello.getQuantita() + quantity);
                contenenteCarrelli.doSave(contenenteCarrello);
            }
 
            jsonResponse.put("success", true);
            jsonResponse.put("message", "Product added to cart successfully");
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Error adding product to cart: " + e.getMessage());
            e.printStackTrace();
        }

        out.print(jsonResponse);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}