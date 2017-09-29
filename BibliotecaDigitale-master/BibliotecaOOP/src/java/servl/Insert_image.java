/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import uti.*;

/**
 *
 * @author leo
 */
public class Insert_image extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void goToPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> data = new HashMap<String, Object>();
        data = Gestione.addTypeUser(request, data);
        FreeMarker.process("inserimento_immagine.jsp", data, response, getServletContext());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        Map<String, Object> data = new HashMap<String, Object>();
        Random random = new Random();
        response.setContentType("text/html;charset=UTF-8");
        int k = 0;
        data = Gestione.addTypeUser(request, data);

        int num_pag = Integer.parseInt(request.getParameter("num_pag"));
        int id = Integer.parseInt(request.getParameter("id"));
        String descrizione = request.getParameter("descrizione");
        int cod = random.nextInt(1000);
        String path = "" + id + "_" + cod;
        String type = null;
        if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
            Part p = request.getPart("photo");
            if (p != null) {
                String name = p.getSubmittedFileName(); //filename should be sanitized
                type = p.getContentType();
                long size = p.getSize();
                if (type.equals("image/jpeg")) {
                    type = "jpg";
                }
                if (type.equals("image/png")) {
                    type = "png";
                }
                String pippo = getServletContext().getRealPath("");
                String pluto = getServletContext().getContextPath();
                String paperino = getServletContext().getInitParameter("uploads.directory");
                if (size > 0 && name != null && !name.isEmpty()) {
                    File target = new File(paperino + File.separatorChar + path + "." + type);
                    //safer: getRealPath may not work in all contexts/configurations
                    //File target = new File(getServletContext().getInitParameter("uploads.directory") + File.separatorChar + name);
                    //doo NOT call the write method. Paths passed to this method are relative to the (temp) location indicated in the multipartconfig!
                    long copy = Files.copy(p.getInputStream(), target.toPath(), StandardCopyOption.REPLACE_EXISTING); //nio utility. Otherwise, use a buffer and copy from inputstream to fileoutputstream
                }
            }
        }
        if (!(Gestione.controllo_esistenza("opera", "id", id + "")) && (Gestione.controllo_esistenza("pagina", "numero_pag", num_pag + ""))) {
            Intermedio.connect();
            Map<String, Object> data2 = new HashMap<String, Object>();
            data2.put("contenuto", descrizione);
            data2.put("id_opera", id);
            data2.put("accettato", 0);
            data2.put("numero_pag", num_pag);
            data2.put("tipo", type);
            data2.put("url_img", path);
            k = Intermedio.insertRecord1("pagina", data2);
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Libro inserito!');");
            out.println("</script>");
            FreeMarker.process("index.jsp", data, response, getServletContext());

        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Immagine già inserita!');");
            out.println("</script>");
            FreeMarker.process("inserimento_immagine.jsp", data, response, getServletContext());
        }

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

            Logger.getLogger(Insert_image.class.getName()).log(Level.SEVERE, null, ex);
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

            Logger.getLogger(Insert_image.class.getName()).log(Level.SEVERE, null, ex);
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
