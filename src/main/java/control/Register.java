package control;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CarrelloBean;
import model.CarrelloDAO;
import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/Register.do")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Regex per la validazione dell'email e dei nomi
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
    private static final Pattern NAME_PATTERN = Pattern.compile("^[a-zA-Z\\s]+$");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mode = request.getParameter("mode");
        UtenteDAO dbUtenti = new UtenteDAO();
        CarrelloDAO dbCarrelli = new CarrelloDAO();
        String path = null;

        if (mode.equals("register")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String passwordCheck = request.getParameter("passwordCheck");
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            Encoder encoder = Base64.getEncoder();
            String pwd64 = encoder.encodeToString(password.getBytes());
            String pwdchk64 = encoder.encodeToString(passwordCheck.getBytes());
            
            boolean isValidEmail = EMAIL_PATTERN.matcher(email).matches();
            boolean isValidNome = NAME_PATTERN.matcher(nome).matches();
            boolean isValidCognome = NAME_PATTERN.matcher(cognome).matches();
            
            try {
                if (!isValidEmail) {
                    request.setAttribute("error", "Email non valida.");
                    path = "register.jsp";  // Resta nella pagina di registrazione in caso di errore
                } else if (!isValidNome || !isValidCognome) {
                    request.setAttribute("error", "Nome e cognome non possono contenere numeri.");
                    path = "register.jsp";  // Resta nella pagina di registrazione in caso di errore
                } else if (pwd64.equals(pwdchk64)) {
                    UtenteBean utente = new UtenteBean();
                    UtenteBean utenteRicercato = new UtenteBean();
                    boolean flag = false;
                    List<UtenteBean> listaUtenti = dbUtenti.doRetrieveAll("");
                    Iterator<UtenteBean> iterUtenti = listaUtenti.iterator();
                    
                    utente.setUsername(username);
                    utente.setPassword(pwd64);
                    
                    while (iterUtenti.hasNext()) {
                        utenteRicercato = iterUtenti.next();
                        if (!utenteRicercato.getUsername().equalsIgnoreCase(utente.getUsername())) {
                            if (utenteRicercato.getEmail().equalsIgnoreCase(email)) {
                                flag = true;
                                break;
                            }
                        }
                    }
                    
                    utente.setEmail(email);
                    utente.setNome(nome);
                    utente.setCognome(cognome);
                    utente.setAdmin(false);
                    
                    if (!flag) {
                        dbUtenti.doSave(utente);

                        // Creazione del carrello per l'utente registrato
                        int maxCarrelloId = dbCarrelli.getMaxCarrelloId();
                        int newCarrelloId = maxCarrelloId + 1;

                        CarrelloBean nuovoCarrello = new CarrelloBean();
                        nuovoCarrello.setIdCarrello(newCarrelloId);
                        nuovoCarrello.setTotale(BigDecimal.ZERO);
                        nuovoCarrello.setNumeroDiProdotti(0);
                        nuovoCarrello.setEmailUtente(email);

                        dbCarrelli.doSave(nuovoCarrello);

                        request.getSession().setAttribute("result", "Registrato con successo!");
                        path = "login.jsp";  // Redirige alla pagina di login in caso di successo
                    } else {
                        request.setAttribute("error", "Email già registrata.");
                        path = "register.jsp";  // Resta nella pagina di registrazione in caso di errore
                    }
                } else {
                    request.setAttribute("error", "Le password non coincidono.");
                    path = "register.jsp";  // Resta nella pagina di registrazione in caso di errore
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Errore nel processo di registrazione. Riprovare.");
                path = "register.jsp";  // Resta nella pagina di registrazione in caso di errore
            }
            
            request.removeAttribute("acquisto");
            RequestDispatcher view = request.getRequestDispatcher(path);
            view.forward(request, response);
        } else if (mode.equals("checkEmail")) {
            response.setContentType("text/plain");
            String email = request.getParameter("email");
            
            try {
                if (dbUtenti.checkEmail(email)) {
                    response.getWriter().print("non disponibile");
                } else {
                    response.getWriter().print("disponibile");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (mode.equalsIgnoreCase("checkUsername")) {
            response.setContentType("text/plain");
            String username = request.getParameter("username");
            
            try {
                if (dbUtenti.checkUsername(username)) {
                    response.getWriter().print("non disponibile");
                } else {
                    response.getWriter().print("disponibile");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
