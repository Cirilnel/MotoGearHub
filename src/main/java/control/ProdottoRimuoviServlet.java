package control;

import model.ProdottoDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/prodottoRimuovi")
public class ProdottoRimuoviServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();

        try {
            String idProdottoStr = request.getParameter("RemoveProdottoId");

            if (idProdottoStr != null && !idProdottoStr.isEmpty()) {
                int idProdotto = Integer.parseInt(idProdottoStr);
                ProdottoDAO prodottoDAO = new ProdottoDAO();

                if (prodottoDAO.doDelete(idProdotto)) {
                    json.put("success", true);
                } else {
                    json.put("success", false);
                    json.put("error", "Product not found or could not be deleted");
                }
            } else {
                json.put("success", false);
                json.put("error", "Invalid product ID");
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("error", "SQL error: " + e.getMessage());
        } catch (NumberFormatException e) {
            json.put("success", false);
            json.put("error", "Invalid product ID format: " + e.getMessage());
        }

        out.print(json.toString());
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
