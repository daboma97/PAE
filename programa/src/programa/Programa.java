/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programa;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import javax.swing.JFrame;
import modelo.accionModelo;
import presentacion.Login;

/**
 *
 * @author dani
 */
public class Programa {

    /**
     * @param args the command line arguments
     */
    /*public static void main(String[] args) 
    {
        
        System.out.println("Hola, escriba su nombre");
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();
        System.out.println("Su nombre es: " + s);
        
        
        accionModelo am = new accionModelo();
        am.mostrarValores();   
    }*/
    
    
    public static void main(String[] args)
    {
        
        Login l = new Login();
        l.setExtendedState(JFrame.MAXIMIZED_BOTH);
        l.setVisible(true);
        
        
        
        /*System.out.println("Bienvenido");
        
        System.out.println("Seleccione que tipo es su Base de Datos");
        System.out.println("1 - MySQL");
        System.out.println("2 - Oracle");
        System.out.println("3 - PostgreSQL");
        System.out.println("4 - DB2 LUW");
        
        Scanner sc = new Scanner(System.in);
        String num = sc.nextLine();
        int numero = Integer.parseInt(num);
        
        if(numero == 1) {
            System.out.println("Ha seleccionado usted MySQL");
        }
        
        System.out.println("Introduzca la URL de su Base de Datos");
        
        String url = sc.nextLine();
        
        System.out.println("Introduzca su usuario");
        String usuario = sc.nextLine();
        System.out.println("Introduzca contraseña");
        String passwd = sc.nextLine();
        
        System.out.println("La base de datos que quiere analizar se llama: " + url);
        System.out.println("El usuario con el que quiere acceder se llama: " + usuario + " y la contraseña es: " + passwd);
        
        accionModelo am = new accionModelo();
        am.conectarBD(url, usuario, passwd);*/
               
        
        
    }
    
}


































