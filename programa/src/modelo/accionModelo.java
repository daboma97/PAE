/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import datos.accionSQL;
import java.util.ArrayList;

/**
 *
 * @author dani
 */
public class accionModelo {
    
    private String conector = "jdbc:mysql://localhost:3306/ey";
    private String userPasado;
    private String passwordPasado;
    private String urlPasado;
    
    public ArrayList<String> listadoTablas() {
        
        accionSQL as = new accionSQL(conector, "dani", "dani");
        
        ArrayList<String> listado = new ArrayList<>();
        listado = as.cogerTodasClases();
        return listadoTablas();
    }
    
    public void mostrarValores() {
        accionSQL as = new accionSQL(conector, "dani", "dani");
        as.mostrarValores();
    }
    
    public void conectarBD(String url, String user, String password)
    {
        urlPasado = url;
        userPasado = user;
        passwordPasado = password;
        accionSQL as = new accionSQL(url, user, password);
    }
    
    public boolean bdConectada()
    {
        accionSQL as = new accionSQL(urlPasado, userPasado, passwordPasado);
        boolean resultado = as.conexionAbierta();
        return resultado;
    }
    
    public String getUrl() {
        return urlPasado;
    }
    
    public void setUrl(String url) {
        this.urlPasado = url;
    }
    
    public String getUser() {
        return userPasado;
    }
    
    public void setUser(String user) {
        this.userPasado = user;
    }
    
    
    
    public String getPassword() {
        return passwordPasado;
    }
    
    public void setPassword(String passwd) {
        this.passwordPasado = passwd;
    }
    
    
    
    
}
