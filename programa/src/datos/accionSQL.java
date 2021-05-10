/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.sql.DatabaseMetaData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



/**
 *
 * @author dani
 */
public class accionSQL {
    
    Connection cn;
    
    public accionSQL(String url, String name, String password) 
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, name, password);
            System.out.println("Me he conectado a la BBDD");
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        
    }
    
    public ArrayList<String> cogerTodasClases()
    {
        ArrayList<String> listado = new ArrayList<>();
        try {
            String sql = "SHOW TABLES";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String clase = rs.getString(1);
                listado.add(clase);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return listado;
    }
    
    public void mostrarValores()
    {
        try {
            DatabaseMetaData metaData = cn.getMetaData();
            String[] types = {"TABLE"};

            ResultSet rs = metaData.getTables(null, null, "%", types);
            while(rs.next())
            {
                String tC = rs.getString(1);
                String tS = rs.getString(2);
                String tN = rs.getString(3);
                System.out.println(tC + " " + tS + " " + tN);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public boolean conexionAbierta()
    {
        boolean resultado = false;
        try {
            if(cn != null && !cn.isClosed()) resultado =true;
            else resultado = false;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }
    
    
}
