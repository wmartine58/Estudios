package carse;

import engine.Inferenceengine;
import javax.tools.Diagnostic;
import vista.nuevaVentana;

/**
 *
 * @author Grupo#2
 */
public class CarSE {
    public static void main(String[] args) {
        nuevaVentana v = new nuevaVentana();
        v.setLocationRelativeTo(null); 
        
        Inferenceengine motor = new Inferenceengine();        
        v.setMotorController(motor);              
        motor.ejecutar();
    }
}