/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package engine;
import java.util.ArrayList;

/**
 *
 * @author Grupo#2
 */

public class Diagnostico{
    private static ArrayList<String> diagnostico = new ArrayList();
    
    public static void clear(){
        System.out.println("\n\nLimpiando lista...");
        diagnostico.clear();
    }
    
    public static ArrayList<String> getDiagnostico(){
        return diagnostico;
    }
    
    public static void setDiagnostico(ArrayList<String> recomendaciones){
        Diagnostico.diagnostico = recomendaciones;
    }
    
    public static void addDiagnostico(String value){
        diagnostico.add(value);
    }
}