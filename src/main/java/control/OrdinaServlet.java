package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContieneBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContieneDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UtenteBean;
import model.ContenenteBean;
import model.ContenenteDAO;
@WebServlet("/order")
public class OrdinaServlet extends HttpServlet {

    private static final long serialVersionUID = 137981767037505776L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
        List<String> errors = new ArrayList<>();
  String formValid = request.getParameter("formValid");
        
        if (!"true".equals(formValid)) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{ \"errors\": [\"Validazione del form fallita\"] }");
            return;
        }
        // Server-side validation
        if (email == null || email.trim().isEmpty()) {
            errors.add("Richiesta invalida");
        }

        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String expiryDate = request.getParameter("expiryDate");
        String indirizzoSpedizione = request.getParameter("indirizzoSpedizione");

        if (cardNumber == null || !cardNumber.matches("^\\d{16}$")) {
            errors.add("Inserisci un numero di carta valido (16 cifre)");
        }

        if (cvv == null || !cvv.matches("^\\d{3,4}$")) {
            errors.add("Inserisci un CVV valido (3 o 4 cifre)");
        }

        if (expiryDate == null || expiryDate.trim().isEmpty()) {
            errors.add("La data di scadenza è obbligatoria");
        }

        if (indirizzoSpedizione == null || indirizzoSpedizione.trim().isEmpty()) {
            errors.add("L'indirizzo di spedizione è obbligatorio");
        }

        if (!errors.isEmpty()) {
            // Imposta gli errori nella risposta e termina la servlet
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Codice di stato 400 per indicare una richiesta non valida

            // Crea una risposta JSON con gli errori
            String jsonResponse = "{ \"errors\": " + errors.toString() + " }";
            response.getWriter().write(jsonResponse);
            return;
        }

        CarrelloDAO carrelli = new CarrelloDAO();
        ContieneDAO ContenenteCarrelli = new ContieneDAO();
        OrdineDAO ordini = new OrdineDAO();
        ProdottoDAO prodotti = new ProdottoDAO();
        ContenenteDAO contenenti = new ContenenteDAO();
        MetodoDiPagamentoDAO MetodiDiPagamento = new MetodoDiPagamentoDAO();

        try {
            MetodoDiPagamentoBean MetodoDiPagamento = new MetodoDiPagamentoBean();
            MetodoDiPagamento.setCVV(cvv);
            MetodoDiPagamento.setEmail(email);
            MetodoDiPagamento.setNCarta(cardNumber);
            LocalDate localDate = LocalDate.parse(expiryDate);
            MetodoDiPagamento.setData(Date.valueOf(localDate));
            CarrelloBean carrello = carrelli.doRetrieveByUserKey(email);
            MetodiDiPagamento.doSave(MetodoDiPagamento);
            int idCarrello = carrello.getIdCarrello();
            List<ContieneBean> ContenenteCarrelloBeanList = (List<ContieneBean>) ContenenteCarrelli.doRetrieveByCarrelloKey(idCarrello);
            OrdineBean ordine = new OrdineBean();
            ordine.setData(Date.valueOf(LocalDate.now()));
            ordine.setEmail(email);
            ordine.setIndirizzo(indirizzoSpedizione);
            ordine.setnCartaIban(cardNumber);

            int idOrdine = ordini.nextId();
            ordini.doSave(ordine);

            ordine.setIdOrdine(idOrdine);
            float spesa = 0;
            for (ContieneBean ContenenteCarrello : ContenenteCarrelloBeanList) {
                int idProdotto = ContenenteCarrello.getIdProdotto();
                ProdottoBean prodotto = prodotti.doRetrieveByKey(idProdotto);
                spesa += prodotto.getPrezzo() * ContenenteCarrello.getQuantita();
                ContenenteBean Contenente = new ContenenteBean(idProdotto, idOrdine, prodotto.getPrezzo(), ContenenteCarrello.getQuantita());
                contenenti.doSave(Contenente);
                ContenenteCarrelloCombinedKey key1 = new ContenenteCarrelloCombinedKey(idProdotto, idCarrello);
                ContenenteCarrelli.doDelete(key1);
            }

            ordine.setSpesa(spesa);
            ordini.doSave(ordine);

            List<OrdineBean> OrdiniList = (List<OrdineBean>) request.getSession().getAttribute("ordini");
            if (OrdiniList == null)
                OrdiniList = new ArrayList<OrdineBean>();
            OrdiniList.add(ordine);

            request.getSession().setAttribute("ordini", OrdiniList);

            for (OrdineBean Ordine : OrdiniList) {
                idOrdine = Ordine.getIdOrdine();
                List<ContenenteBean> ContenenteBeanList = (List<ContenenteBean>) contenenti.doRetrieveByOrderKey(idOrdine);
                request.getSession().setAttribute("contenente" + Integer.toString(idOrdine), ContenenteBeanList);
                for (ContenenteBean Contenente : ContenenteBeanList) {
                    int idProdotto = Contenente.getIdProdotto();
                    ProdottoBean Prodotto = prodotti.doRetrieveByKey(idProdotto);
                    request.getSession().setAttribute("prodotto" + Integer.toString(idProdotto), Prodotto);
                }
            }

            // Se tutto va a buon fine, inoltra alla pagina /carrello
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_OK); // Codice di stato 200 per indicare successo
            response.getWriter().write("{ \"success\": true }");

            RequestDispatcher dispatcherToCarrello = request.getRequestDispatcher("/carrello");
            dispatcherToCarrello.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestione degli errori SQL, se necessario
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
