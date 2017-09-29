/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import uti.Gestione;

/**
 *
 * @author leo
 */
public class Book {

    private String id;
    private String titolo;
    private String autore;
    private String descrizione;
    private int anno_pub;
    private Date data_ins;

    public Book(ResultSet rs) throws SQLException {
        this.id=rs.getString("id");
        this.titolo = rs.getString("titolo");
        this.autore = rs.getString("autore");
        this.descrizione = rs.getString("descrizione");
        this.data_ins = rs.getDate("data_aggiunta");

    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public void setAnno_pub(int anno_pub) {
        this.anno_pub = anno_pub;
    }

    public void setData_ins(Date data_ins) {
        this.data_ins = data_ins;
    }

    public String getTitolo() {
        return titolo;
    }

    public String getAutore() {
        return autore;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public int getAnno_pub() {
        return anno_pub;
    }

    public Date getData_ins() {
        return data_ins;
    }
}
