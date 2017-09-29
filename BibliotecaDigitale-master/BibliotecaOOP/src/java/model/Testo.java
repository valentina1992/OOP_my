/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author valentina
 */
public class Testo {

    private int id;
    private String titolo;
    private String paragrafo;

    public Testo(ResultSet rs) throws SQLException {
        this.id = Integer.parseInt(rs.getString("id"));
        this.titolo = rs.getString("titolo");
        this.paragrafo = rs.getString("paragrafo");
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitolo() {
        return titolo;
    }

    public String getParagrafo() {
        return paragrafo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public void setParagrafo(String paragrafo) {
        this.paragrafo = paragrafo;
    }

}
