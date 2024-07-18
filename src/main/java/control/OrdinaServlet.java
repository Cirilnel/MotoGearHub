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
public class OrdinaServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 137981767037505776L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherToOrdine = request.getRequestDispatcher("/carrello");
	
		String email = (String) request.getSession().getAttribute("email");
		List<String> errors = new ArrayList<>();
		
		if(email == null || email.trim().isEmpty()) {
			errors.add("richiesta invalida");
		}
		
        if (!errors.isEmpty()) {
        	request.setAttribute("errors", errors);
        	RequestDispatcher dispatcherToHome = request.getRequestDispatcher("home.jsp");
        	dispatcherToHome.forward(request, response);
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
			MetodoDiPagamento.setCVV(request.getParameter("cvv"));
			MetodoDiPagamento.setEmail(email);
			MetodoDiPagamento.setNCarta(request.getParameter("cardNumber"));
			LocalDate localDate = LocalDate.parse(request.getParameter("expiryDate"));
			MetodoDiPagamento.setData(Date.valueOf(localDate));
			CarrelloBean carrello = carrelli.doRetrieveByUserKey(email);
			MetodiDiPagamento.doSave(MetodoDiPagamento);
			int idCarrello = carrello.getIdCarrello();
			ContenenteCarrelloCombinedKey key = new ContenenteCarrelloCombinedKey();
			key.setIdCarrello(idCarrello);
			List<ContieneBean> ContenenteCarrelloBeanList = (List<ContieneBean>) ContenenteCarrelli.doRetrieveByCarrelloKey(idCarrello);
			OrdineBean ordine = new OrdineBean();
			ordine.setData(Date.valueOf(LocalDate.now()));
			ordine.setEmail(email);
			ordine.setIndirizzo(request.getParameter("indirizzoSpedizione"));
			ordine.setnCartaIban(request.getParameter("cardNumber"));
			
			int idOrdine = ordini.nextId();
			ordini.doSave(ordine);
			
			ordine.setIdOrdine(idOrdine);
			float spesa=0;
			for(ContieneBean ContenenteCarrello : ContenenteCarrelloBeanList) {
				
				int idProdotto = ContenenteCarrello.getIdProdotto();
				ProdottoBean prodotto = prodotti.doRetrieveByKey(idProdotto);
				spesa += prodotto.getPrezzo()*ContenenteCarrello.getQuantita();
				ContenenteBean Contenente = new ContenenteBean(idProdotto, idOrdine, prodotto.getPrezzo(), ContenenteCarrello.getQuantita());
				contenenti.doSave(Contenente);
				ContenenteCarrelloCombinedKey key1 = new ContenenteCarrelloCombinedKey(idProdotto, idCarrello);
				ContenenteCarrelli.doDelete(key1);
			}
			
			ordine.setSpesa(spesa);
			ordini.doSave(ordine);
			
			

			OrdineDAO Ordini = new OrdineDAO();
			ContenenteDAO Contenenti = new ContenenteDAO();
			ProdottoDAO Prodotti = new ProdottoDAO();
			List<OrdineBean> OrdiniList = (List<OrdineBean>) request.getSession().getAttribute("ordini");
			if(OrdiniList==null)
				OrdiniList = new ArrayList<OrdineBean>();
			OrdiniList.add(ordine);
			
			request.getSession().setAttribute("ordini", OrdiniList);
			
			for(OrdineBean Ordine: OrdiniList) {
				idOrdine = Ordine.getIdOrdine();
				
				List<ContenenteBean> ContenenteBeanList = (List<ContenenteBean>) Contenenti.doRetrieveByOrderKey(idOrdine);
				request.getSession().setAttribute("contenente"+Integer.toString(idOrdine), ContenenteBeanList);
				for(ContenenteBean Contenente: ContenenteBeanList) {
					int idProdotto = Contenente.getIdProdotto();
					ProdottoBean Prodotto = Prodotti.doRetrieveByKey(idProdotto);
					request.getSession().setAttribute("prodotto"+Integer.toString(idProdotto), Prodotto);
					
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        		
        		
        		
        		
        		
        dispatcherToOrdine.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}