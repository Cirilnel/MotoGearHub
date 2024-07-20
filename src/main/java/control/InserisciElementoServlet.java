package control;

import model.ProdottoBean;
import model.ProdottoDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/inserisciElemento")
public class InserisciElementoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Verifica se l'utente è un admin
        Boolean isAdmin = (Boolean) request.getSession().getAttribute("is_admin");
        if (isAdmin == null || !isAdmin) {
            // Se l'utente non è un admin, reindirizza alla pagina di errore o accesso negato
            response.sendRedirect("accessoNegato.jsp"); // Cambia con la tua pagina di errore o accesso negato
            return;
        }

        // Ottieni i parametri dal modulo
        String marca = request.getParameter("marca");
        String image = request.getParameter("image");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));

        ProdottoBean prodotto = new ProdottoBean();
        prodotto.setMarca(marca);
        prodotto.setImage(image);
        prodotto.setPrezzo((int) prezzo); // Cast to int if database stores price as integer
        prodotto.setNome(nome);
        prodotto.setDescrizione(descrizione);
        prodotto.setIdCategoria(idCategoria);
      
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        try {
            // Ottiene il prossimo ID disponibile
            int idProdotto = prodottoDAO.nextId();
            prodotto.setIdProdotto(idProdotto);

            // Salva il prodotto nel database
            prodottoDAO.doSave(prodotto);

            // Redirige alla pagina di amministrazione o successivamente
            response.sendRedirect("admin.jsp?success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestione dell'errore (mostra un messaggio di errore all'utente)
            response.sendRedirect("admin.jsp?error=true");
        }
    }
}
