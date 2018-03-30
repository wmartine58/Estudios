/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package engine;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jess.Fact;
import jess.JessException;
import jess.RU;
import jess.Rete;
import jess.Value;

import engine.Diagnostico;

/**
 *
 * @author Grupo#2
 */

public class Inferenceengine implements Serializable{
    Rete inference_engine;
    public Inferenceengine(){
        try{
            inference_engine = new Rete();
            inference_engine.reset();
            inference_engine.batch("clips/mecanica.clp");
                           
        }catch(JessException ex){
            System.out.println(ex);
        }
    }

    public void assertFacts(ArrayList<String>motor, ArrayList<String>transmision,ArrayList<String>direccion, ArrayList<String>suspension, ArrayList<String>frenos) throws JessException, MalformedURLException, UnsupportedEncodingException{
        System.out.println("\n\nAfirmando Hechos...");
            inference_engine.reset();
        Diagnostico.clear();
        for(String hecho:motor){
            Fact f = new Fact("motor", inference_engine);
            f.setSlotValue("tipo-motor", new Value(hecho, RU.STRING));
            inference_engine.assertFact(f);
        }
        for(String hecho:transmision){
            Fact f = new Fact("transmision", inference_engine);
            f.setSlotValue("tipo-transmision", new Value(hecho, RU.STRING));
            inference_engine.assertFact(f);
        }
        for(String hecho:direccion){
            Fact f = new Fact("direccion", inference_engine);
            f.setSlotValue("tipo-direccion", new Value(hecho, RU.STRING));
            inference_engine.assertFact(f);
        }
        for(String hecho:suspension){
            Fact f = new Fact("suspension", inference_engine);
            f.setSlotValue("tipo-suspension", new Value(hecho, RU.STRING));
            inference_engine.assertFact(f);
        }
        for(String hecho:frenos){
            Fact f = new Fact("frenos", inference_engine);
            f.setSlotValue("tipo-frenos", new Value(hecho, RU.STRING));
            System.out.println(hecho);
            inference_engine.assertFact(f);
        }
        
        inference_engine.run();

        //System.out.println(Diagnostico.getDiagnostico());
        //Diagnostico.setDiagnostico(new ArrayList());
    }
    
    public void ejecutar(){
        try {
            this.inference_engine.run();
        } catch (JessException ex) {
            Logger.getLogger(Inferenceengine.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}