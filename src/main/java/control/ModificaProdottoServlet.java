package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/modificaProdotto")
public class ModificaProdottoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera i parametri dal modulo
        int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String descrizione = request.getParameter("descrizione");
        int prezzo = Integer.parseInt(request.getParameter("prezzo"));
        String image = request.getParameter("image");

        // Crea un'istanza di ProdottoBean con i dati modificati
        ProdottoBean prodotto = new ProdottoBean();
        prodotto.setIdProdotto(idProdotto);
        prodotto.setNome(nome);
        prodotto.setMarca(marca);
        prodotto.setDescrizione(descrizione);
        prodotto.setPrezzo(prezzo);
        prodotto.setImage(image);

        // Utilizza un DAO per aggiornare il prodotto nel database
        try {
        
            ProdottoDAO prodottoDAO = new ProdottoDAO();
            prodottoDAO.updateProdotto(prodotto);
        } catch (Exception e) {
            e.printStackTrace();
            // Gestisci l'errore (ad esempio, mostra un messaggio di errore all'utente)
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        // Reindirizza alla pagina di catalogo o ad un'altra pagina
        response.sendRedirect(request.getContextPath() + "/collezione");
    }
}
