package servl;

import uti.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import model.Utente;

public class Login extends HttpServlet {

    public String email;
    public String password;
    public int tipo;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
        Map< String, Object> data = new HashMap< String, Object>();
        PrintWriter out = response.getWriter();
        Utente utente = null;
        email = request.getParameter("email");
        password = request.getParameter("password");
        if (!Gestione.session_check(request)) {
            ResultSet rs = Intermedio.selectRecord("utente", "email='" + email + "'");
            if (rs.next()) {
                utente = new Utente(rs);
            }
            Gestione.attiva_sessione(request, utente.getTipo());
            data.put("admin", utente.getTipo());
            FreeMarker.process("index.jsp", data, response, getServletContext());
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Sei già loggato');");
            out.println("</script>");
            Gestione.invalida(request);
            FreeMarker.process("index.jsp", data, response, getServletContext());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Gestione.gestisciErrore(response, request, getServletContext());
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Gestione.gestisciErrore(response, request, getServletContext());
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Gestione.gestisciErrore(response, request, getServletContext());
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Gestione.gestisciErrore(response, request, getServletContext());

        } catch (SQLException ex) {
            Gestione.gestisciErrore(response, request, getServletContext());

        } catch (Exception ex) {
            Gestione.gestisciErrore(response, request, getServletContext());

        }
    }

}
