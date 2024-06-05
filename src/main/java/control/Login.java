package control;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DriverManagerConnectionPool;
import model.UserBean;

@WebServlet("/Login.do")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("j_username");
        String password = request.getParameter("j_password");
        String redirectedPage = "/login.jsp";
        boolean control = false;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DriverManagerConnectionPool.getConnection();
            System.out.println("Database connection established");

            String sql = "SELECT Username, Password, Nome, Cognome, is_admin FROM Utente WHERE Username = ? AND Password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, checkPsw(password));
            rs = ps.executeQuery();

            if (rs.next()) {
                control = true;
                System.out.println("User found in the database");

                UserBean registeredUser = new UserBean();
                registeredUser.setUsername(rs.getString("Username"));
                registeredUser.setNome(rs.getString("Nome"));
                registeredUser.setCognome(rs.getString("Cognome"));
                registeredUser.setPassword(rs.getString("Password"));
                registeredUser.setAdmin(rs.getBoolean("is_admin"));
                request.getSession().setAttribute("registeredUser", registeredUser);
                request.getSession().setAttribute("username", rs.getString("Username"));
                request.getSession().setAttribute("nome", rs.getString("Nome"));

                redirectedPage = "/index.jsp";
            } else {
                System.out.println("User not found or incorrect password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectedPage = "/login.jsp";
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) DriverManagerConnectionPool.releaseConnection(con);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (!control) {
            request.getSession().setAttribute("login-error", true);
        } else {
            request.getSession().setAttribute("login-error", false);
        }
        response.sendRedirect(request.getContextPath() + redirectedPage);
    }

    protected String checkPsw(String psw) {
        String hashtext = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(psw.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            hashtext = number.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println("Generated hash: " + hashtext);
        return hashtext;
    }
}