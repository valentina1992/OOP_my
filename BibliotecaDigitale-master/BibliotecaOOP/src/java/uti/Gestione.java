package uti;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import model.Book;
import model.Utente;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.HashMap;
import javax.servlet.ServletContext;
import model.Immagine;
import model.Testo;

/**
 *
 * @author leo
 */
public class Gestione extends HttpServlet {

    static HttpSession session;

    public static boolean session_check(HttpServletRequest request) {
        boolean check = true;
        session = request.getSession(true);
        if (session.isNew()) {
            check = false;
        } else {
            //inizio sessione
            //session start timestamp
            Calendar begin = (Calendar) session.getAttribute("inizio-sessione");
            //ultima azione
            //last action timestamp
            Calendar last = (Calendar) session.getAttribute("ultima-azione");
            //data/ora correnti
            //current timestamp
            Calendar now = Calendar.getInstance();
            if (begin == null) {
                check = false;
            } else {
                //secondi trascorsi dall'inizio della sessione
                //seconds from the session start
                long secondsfrombegin = (now.getTimeInMillis() - begin.getTimeInMillis()) / 1000;
                //dopo tre ore la sessione scade
                //after three hours the session is invalidated
                if (secondsfrombegin > 3 * 60 * 60) {
                    check = false;
                } else if (last != null) {
                    //secondi trascorsi dall'ultima azione
                    //seconds from the last valid action
                    long secondsfromlast = (now.getTimeInMillis() - last.getTimeInMillis()) / 1000;
                    //dopo trenta minuti dall'ultima operazione la sessione   invalidata
                    //after 30 minutes since the last action the session is invalidated                    
                    if (secondsfromlast > 30 * 60) {
                        check = false;
                    }
                }
            }
        }
        if (!check) {
            session.invalidate();
        } else {
            //reimpostiamo la data/ora dell'ultima azione
            //if che checks are ok, update the last action timestamp
            session.setAttribute("ultima-azione", Calendar.getInstance());
        }
        return check;

    }

    public static void attiva_sessione(HttpServletRequest request, int type) {
        session = request.getSession(true);
        if (session.isNew()) {
            session.setAttribute("inizio-sessione", Calendar.getInstance());
            session.setAttribute("email", request.getParameter("email"));
            session.setAttribute("tipo", String.valueOf(type));
        }
    }

    public static String getEmail(HttpServletRequest request) {
        return session.getAttribute("email").toString();
    }

    public static int getType(HttpServletRequest request) {
        if (session_check(request)) {
            int i = Integer.parseInt(session.getAttribute("tipo").toString());
            return Integer.parseInt(session.getAttribute("tipo").toString());
        } else {
            return 0;
        }
    }

    public static void setType(int tipo) {
        String type = String.valueOf(4);
        session.setAttribute("tipo", type);
    }

    public static void invalida(HttpServletRequest request) {
        session.invalidate();
    }

    public static List< Book> libri_data_pub() throws Exception {
        List< Book> book = new ArrayList();
        Intermedio.connect();
        ResultSet rs = Intermedio.selectJoin("libro.*, utente.nome, utente.cognome", "libro", "utente", "utente_fk=email", "", "data_ins");
        while (rs.next()) {
            Book libro = new Book(rs);
            book.add(libro);
        }
        return book;
    }

    /**
     * Lista dei libri
     *
     * @param page pagina visualizzata
     * @param numeroDiPagine numero di libri per pagina
     * @param condition condizione per il filtro dei dati
     * @param order ordinamento dei dati
     * @return
     * @throws Exception
     */
    public static List< Book> libri_data_pub(String condition, String order) throws Exception {
        List< Book> book = new ArrayList();
        String orderType;
        if (order.equals("data_aggiunta")) {
            orderType = "DESC";
        } else {
            orderType = "ASC";
        }
        ResultSet rs = Intermedio.selectRecord("opera", condition, order + " " + orderType);
        while (rs.next()) {
            book.add(new Book(rs));
        }
        return book;
    }

    public static Book detail_book(String isbn) throws Exception {
        Book book = null;
        Intermedio.connect();
        ResultSet rs = Intermedio.selectJoin("libro.*, utente.nome, utente.cognome", "libro", "utente", "utente_fk=email", "isbn='" + isbn + "'", "data_ins");
        if (rs.next()) {
            book = new Book(rs);
        }
        return book;
    }

    public static Utente utente(String email) throws Exception {
        Utente utente = null;
        ResultSet rs = Intermedio.selectRecord("utente", "email='" + email + "'");
        if (rs.next()) {
            utente = new Utente(rs);
        }
        return utente;
    }

    public static boolean controllo_esistenza(String table, String campo, String value) throws SQLException, IOException {
        ResultSet rs = Intermedio.selectRecord(table, campo + "='" + value + "'");
        return !rs.next();
    }

    public static boolean controllo_esistenza(String table1, String table2, String joincond, String campo, String value) throws SQLException {
        ResultSet rs = Intermedio.selectJoin(table1, table2, joincond, campo + "='" + value + "'");
        return !rs.next();
    }

    public static boolean controllo_esistenza(String table1, String table2, String joincond, String campo1, String value1, String campo2, String value2) throws SQLException {
        ResultSet rs = Intermedio.selectJoin(table1, table2, joincond, campo1 + "='" + value1 + "' AND " + campo2 + "='" + value2 + "'");
        return !rs.next();
    }

    public static Map paginaLibro(HttpServletRequest request, Map data) throws SQLException, IOException {
        List< Immagine> immagini = new ArrayList();
        List< Testo> testo = new ArrayList();
        int idopera = Integer.parseInt(request.getParameter("idopera"));
        ResultSet rs = null;
        ResultSet rs1 = null;

        if (Gestione.session_check(request)) {
            switch (Gestione.getType(request)) {

                case 4: {
                    rs1 = Intermedio.selectJoin("capitolo.id,capitolo.titolo,capitolo.paragrafo,capitolo.id_libro", "opera", "capitolo", "opera.id=capitolo.id_libro", "opera.id='" + idopera + "' AND accettato=0", "capitolo.id");
                    rs = Intermedio.selectJoin("pagina.id,pagina.tipo,pagina.url_img,pagina.id_opera,pagina.data,pagina.numero_pag", "opera", "pagina", "opera.id=pagina.id_opera", "opera.id='" + idopera + "'", "numero_pag");

                    break;
                }
                case 5: {
                    rs = Intermedio.selectJoin("pagina.id,pagina.tipo,pagina.url_img,pagina.id_opera,pagina.data,pagina.numero_pag", "opera", "pagina", "opera.id=pagina.id_opera", "opera.id='" + idopera + "' AND accettato=0", "numero_pag");
                    rs1 = Intermedio.selectJoin("capitolo.id,capitolo.titolo,capitolo.paragrafo,capitolo.id_libro", "opera", "capitolo", "opera.id=capitolo.id_libro", "opera.id='" + idopera + "'", "capitolo.id");
                    break;
                }
                default: {
                    rs = Intermedio.selectJoin("pagina.id,pagina.tipo,pagina.url_img,pagina.id_opera,pagina.data,pagina.numero_pag", "opera", "pagina", "opera.id=pagina.id_opera", "opera.id='" + idopera + "' AND accettato=1", "numero_pag");
                    rs1 = Intermedio.selectJoin("capitolo.id,capitolo.titolo,capitolo.paragrafo,capitolo.id_libro", "opera", "capitolo", "opera.id=capitolo.id_libro", "opera.id='" + idopera + "' AND accettato=1", "capitolo.id");
                    break;
                }
            }
        }

        while (rs.next()) {
            immagini.add(new Immagine(rs));
        }
        while (rs1.next()) {
            testo.add(new Testo(rs1));
        }
        ResultSet rs2 = Intermedio.selectRecord("opera", "id=" + idopera);
        Book opera = null;
        while (rs2.next()) {
            opera = new Book(rs2);
        }
        data.put("idopera", opera.getTitolo());
        data.put("testo", testo);
        data.put("immagini", immagini);
        return data;
    }

    public static int checkNumeric(String s) throws NumberFormatException {
        //convertiamo la stringa in numero, ma assicuriamoci prima che sia valida
        //convert the string to a number, ensuring its validity
        if (s != null) {
            //se la conversione fallisce, viene generata un'eccezione
            //if the conversion fails, an exception is raised
            return Integer.parseInt(s);
        } else {
            throw new NumberFormatException("String argument is null");
        }
    }

    public static Map addTypeUser(HttpServletRequest request, Map data) {
        int admin = 0;
        if (Gestione.session_check(request)) {
            switch (Gestione.getType(request)) {
                case 1: {
                    admin = 1;
                    break;
                }
                case 2: {
                    admin = 2;
                    break;
                }
                case 3: {
                    admin = 3;
                    break;
                }
                case 4: {
                    admin = 4;
                    break;
                }
                case 5: {
                    admin = 5;
                    break;
                }
                case 6: {
                    admin = 6;
                    break;
                }
            }
        }
        data.put("admin", admin);
        return data;
    }

    public static Map getPage(HttpServletRequest request, Map data) throws SQLException, Exception {
        int numeroDiLibri = 10;
        List<Book> books = new ArrayList();
        List<Utente> utenti = new ArrayList();
        int end = Intermedio.countRecord("libro", "");
        int fine = end;
        int page;
        int resto = end % numeroDiLibri;
        if (resto != 0) {
            fine = end;
            end = end + numeroDiLibri;
        }
        data.put("last", true);
        String mov = (String) request.getParameter("mov");
        if (mov == null) {
            page = 1;
            if (fine < numeroDiLibri) {
                data.put("last", false);
            }
        } else {
            page = Integer.parseInt((String) request.getParameter("page"));
            if (((page + 1) == (end / numeroDiLibri)) && (mov.equals("avanti"))) {
                data.put("last", false);
            }
            if ((page < (end / numeroDiLibri)) && (mov.equals("avanti"))) {
                page++;
            }
            if ((page >= 1) && (mov.equals("indietro"))) {
                page--;
            }
        }
        books = libri_data_pub("", "data_ins");
        data.put("utenti", utenti);
        data.put("books", books);
        data.put("pagina", page);
        return data;
    }

    /**
     * Controllo su String. Contiene solo caratteri alfanumerici?
     *
     * @param toCheck stringa sul quale effettuare il controllo
     * @param space se true accetta anche gli spazi.
     * @return true se la stringa è alfanumerica, false altrimenti.
     */
    public static boolean isAlphanumeric(String toCheck, boolean space) {
        if (toCheck.equals("")) {
            return true;
        }

        if (space) {
            return toCheck.matches("[a-zA-Z' ]+");
        } else {
            return toCheck.matches("[a-zA-Z']+");
        }

    }

    /**
     * Eliminazione degli spazi esterni e dei doppi spazi interni
     *
     * @param toTrim stringa da elaborare
     * @return stringa "pulita"
     */
    public static String spaceTrim(String toTrim) {
        return toTrim.trim().replaceAll("\\s+", " ");
    }

    /**
     * Cripta una stringa
     *
     * @param string stringa da criptare
     * @return stringa criptata
     */
    public static String crypt(String string) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
            byte[] passBytes = string.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            return null;
        }

    }

    /**
     * Verifica se una stringa criptata è stata generata da un'altra stringa
     *
     * @param string_crypted stringa criptata
     * @param to_check stringa da verificare
     * @return true se la password è stata verificata, false altrimenti
     */
    public static boolean decrypt(String string_crypted, String to_check) {
        if (to_check == null || string_crypted == null) {
            return false;
        }
        return string_crypted.equals(crypt(to_check));
    }

    public static Object getId(HttpServletRequest request) {
        return session.getAttribute("id").toString();
    }

    public static List<Utente> utenti() throws SQLException, IOException {
        List< Utente> user = new ArrayList();

        ResultSet rs = Intermedio.selectRecord("utente", "");
        while (rs.next()) {
            user.add(new Utente(rs));
        }
        return user;

    }

    public static void gestisciErrore(HttpServletResponse response, HttpServletRequest request, ServletContext servletContext) throws IOException {
        Map<String, Object> data = new HashMap<String, Object>();
        data = Gestione.addTypeUser(request, data);
        FreeMarker.process("error.jsp", data, response, servletContext);
    }
}
