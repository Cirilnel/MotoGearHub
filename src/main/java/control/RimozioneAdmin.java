package control;

import java.io.IOException;
import java.io.PrintWriter;
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
            
            // Verifica se l'utente � un admin
            Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
            if (isAdmin != null && isAdmin) {
                // Se l'utente � un admin, reindirizza alla pagina di rimozione
                response.sendRedirect("rimozione.jsp");
            } else {
                // Se l'utente non � un admin, reindirizza alla pagina di errore o login
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
        // Imposta il tipo di contenuto della risposta come JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Ottieni l'ID del prodotto da rimuovere dalla richiesta
        String removeProdottoId = request.getParameter("RemoveProdottoId");
        
        // Inizializza una variabile per determinare se l'operazione � riuscita
        boolean success = false;
        String errorMessage = null;

        try {
            // Verifica se l'utente � un admin
            Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
            if (isAdmin != null && isAdmin) {
                // Crea un'istanza del DAO
                ProdottoDAO prodottoDAO = new ProdottoDAO();
                
                // Rimuovi il prodotto dal database
                success = prodottoDAO.doDelete(Integer.parseInt(removeProdottoId));
                
                if (success) {
                    // Recupera di nuovo la lista aggiornata dei prodotti
                    List<ProdottoBean> prodottiList = prodottoDAO.doRetrieveAll("");
                    // Memorizza la lista dei prodotti nella sessione
                    request.getSession().setAttribute("ProdottiList", prodottiList);
                } else {
                    errorMessage = "Impossibile rimuovere il prodotto.";
                }
            } else {
                errorMessage = "Non sei autorizzato a effettuare questa operazione.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Errore durante la rimozione del prodotto: " + e.getMessage();
        }

        // Crea la risposta JSON manualmente
        PrintWriter out = response.getWriter();
        String jsonResponse;
        
        if (success) {
            jsonResponse = "{\"success\": true, \"message\": \"Prodotto rimosso con successo!\"}";
        } else {
            jsonResponse = "{\"success\": false, \"message\": \"" + (errorMessage != null ? errorMessage : "Errore sconosciuto") + "\"}";
        }
        
        out.print(jsonResponse);
        out.flush();
    }
}
