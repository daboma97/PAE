/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.DatabaseMetaData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;



/**
 *
 * @author dani
 */
public class accionSQL {
    
    Connection cn;
    String url;
    String user;
    String password;
    
    public accionSQL(String url, String name, String password) 
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, name, password);
            //System.out.println("Me he conectado a la BBDD");
            this.url = url;
            this.user = name;
            this.password = password;
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        
    }
    
    public ArrayList<String> mostrarValores()
    {
        ArrayList<String> listado = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, password);
            DatabaseMetaData metaData = cn.getMetaData();
            String[] types = {"TABLE"};

            ResultSet rs = metaData.getTables(null, null, "%", types);
            while(rs.next())
            {
                String tC = rs.getString(1);
                String tS = rs.getString(2);
                String tN = rs.getString(3);
                //1System.out.println(tC + " " + tS + " " + tN);
                listado.add(tN);
                
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listado;
    }
    
    public void iniciarAnonimizacion(String fecha, String tabla) 
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, password);
            
            String sql = "SELECT * FROM " + tabla;
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int resultadoUpdate = 0;
            while(rs.next()) {
                String fechaRegistro = rs.getString(12);
                Date d1 = new SimpleDateFormat("dd/MM/yyyy").parse(fechaRegistro);
                Date d2 = new SimpleDateFormat("dd/MM/yyyy").parse(fecha);
                
                if(d2.after(d1)) {
                    int id = rs.getInt(1);
                    String nombre = rs.getString(2);
                    String apellido = rs.getString(3);
                    String email = rs.getString(5);
                    String direccion = rs.getString(6);
                    String nTargeta = rs.getString(11);
                    
                    String sql2 = "UPDATE clients SET nom = '" + anonimizar(nombre) + "', cognom = '" + anonimizar(apellido) + "', email= '" + anonimizar(email) + "', " + 
                            "adresa= '" + anonimizar(direccion) + "', nTargeta= '" + anonimizar(nTargeta) + "' WHERE idClient = " + id;
                    PreparedStatement ps2 = cn.prepareStatement(sql2);
                    resultadoUpdate = ps2.executeUpdate();
                }  
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        } catch(ParseException e) {
            e.printStackTrace();
        }
        
        
    }
    
    private String anonimizar(String valor) {
        byte[] encriptado = new byte[256];
        try {
            /*Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            byte[] valorBytes = new byte[16];
            valorBytes = valor.getBytes("UTF-");
            SecretKeySpec sks = new SecretKeySpec(valorBytes, "AES");
            cipher.init(Cipher.ENCRYPT_MODE, sks);
            
            encriptado = cipher.doFinal(valor.getBytes());
            */
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[16];
            random.nextBytes(salt);
            
            KeySpec spec = new PBEKeySpec(valor.toCharArray(), salt, 65536, 256);
            SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] key = f.generateSecret(spec).getEncoded();
            SecretKeySpec keySpec = new SecretKeySpec(key, "AES");
            
            byte[] bytes = new byte[16];
            random.nextBytes(bytes);
            IvParameterSpec iv = new IvParameterSpec(bytes);
            
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, iv);
            encriptado = cipher.doFinal(valor.getBytes());
            
            
        
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidAlgorithmParameterException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(accionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return encriptado.toString();
        
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
    
    public void cerrarConexion() 
    {
        try {
            cn.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    
    
    
}
