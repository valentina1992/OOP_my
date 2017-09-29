/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;
import uti.FreeMarker;
import uti.Gestione;

/**
 *
 * @author
 */
public class Search extends HttpServlet {

    protected void goToPage(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Map<String, Object> data = new HashMap<String, Object>();
        data = Gestione.addTypeUser(request, data);
        data.put("book", Gestione.libri_data_pub("", "data_aggiunta"));

        FreeMarker.process("search_title.jsp", data, response, getServletContext());
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        Map<String, Object> data = new HashMap<String, Object>();
        List< Book> book = new ArrayList();
        data = Gestione.addTypeUser(request, data);
        String generic = request.getParameter("generic");
        String titolo = request.getParameter("titolo");
        String autore = request.getParameter("autore");

        //autore=''or titolo=''or isbn=''or anno_pub='0'or lingua='italiano'or download =null
        String condizione = "autore='" + generic + "'" + "or " + "titolo='" + generic + "'"/* + "or " + "data=" + anno*/;

        if (titolo == null) {
            titolo = "";
        }
        if (autore == null) {
            autore = "";
        }

        data.put("autore", autore);
        data.put("titolo", titolo);

        data.put("book", Gestione.libri_data_pub(condizione, "data_aggiunta"));
        FreeMarker.process("search_title.jsp", data, response, getServletContext());

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            goToPage(request, response);
        } catch (Exception ex) {
                                Gestione.gestisciErrore(response,request, getServletContext());

            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
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
                                Gestione.gestisciErrore(response,request, getServletContext());

            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
