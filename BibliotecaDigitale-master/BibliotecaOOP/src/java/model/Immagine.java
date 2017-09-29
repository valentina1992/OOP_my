/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author leo
 */
public class Immagine {
    private String url_img;
    private int id;
    private int id_opera;
    private Date data;
    private int numero_pag;
    private String tipo;

    public Immagine(ResultSet rs) throws SQLException {
        this.id=Integer.parseInt(rs.getString("id"));
        this.tipo=rs.getString("tipo");
        this.url_img = rs.getString("url_img");
                this.url_img = "cover" + "/" + url_img + "." + tipo;
        this.id_opera = Integer.parseInt(rs.getString("id_opera"));
        this.data = rs.getDate("data");
        this.numero_pag=Integer.parseInt(rs.getString("numero_pag"));
    }

    public String getUrl_img() {
        return url_img;
    }

    public int getId() {
        return id;
    }

    public int getId_opera() {
        return id_opera;
    }

    public Date getData() {
        return data;
    }

    public int getNumero_pag() {
        return numero_pag;
    }

    public void setUrl_img(String url_img) {
        this.url_img = url_img;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setId_opera(int id_opera) {
        this.id_opera = id_opera;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public void setNumero_pag(int numero_pag) {
        this.numero_pag = numero_pag;
    }
    
}
