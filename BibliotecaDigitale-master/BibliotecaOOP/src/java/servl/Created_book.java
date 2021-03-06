/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uti.FreeMarker;
import uti.Gestione;
import uti.Intermedio;

/**
 *
 * @author valentina
 */
public class Created_book extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occu
     */
    protected void goToPage(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Map<String, Object> data = new HashMap<String, Object>();
        data = Gestione.addTypeUser(request, data);
        FreeMarker.process("creazione_libro.jsp", data, response, getServletContext());

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, Exception {
        Map<String, Object> data = new HashMap<String, Object>();
        Intermedio.connect();
        response.setContentType("text/html;charset=UTF-8");
        data = Gestione.addTypeUser(request, data);
        String titolo_libro = request.getParameter("libro");
        String capitolo = request.getParameter("capitolo");
        String paragrafo = request.getParameter("paragrafo");
        Map<String, Object> data2 = new HashMap<String, Object>();
        data2.put("id_libro", titolo_libro);
        data2.put("titolo", capitolo);
        data2.put("paragrafo", paragrafo);
        data2.put("accettato", 0);
        Intermedio.insertRecord("capitolo", data2);
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Capitolo inserito inserito!');");
        out.println("</script>");
        FreeMarker.process("index.jsp", data, response, getServletContext());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            goToPage(request, response);
        } catch (Exception ex) {
            Gestione.gestisciErrore(response, request, getServletContext());
            Logger.getLogger(Created_book.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Gestione.gestisciErrore(response, request, getServletContext());

            Logger.getLogger(Created_book.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
