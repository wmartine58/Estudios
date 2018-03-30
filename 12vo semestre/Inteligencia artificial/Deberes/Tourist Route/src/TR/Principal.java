package TR;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Principal {
	static Statement sentencia;
	static ResultSet result, id, rutaEvent;
	static int nEvent = 1;
	
	public static void main(String[] args) {
	    System.out.println("System for recommending" + 
	    		"the best Ecuadorian tourist route from Guayaquil to Quito");

        Evento e = new Evento();
        MotorController motorController = new MotorController();       
        EventHandler eventController = new EventHandler(e);
        
 
        e.setMotorController(motorController);
        
        motorController.addEscuchador(eventController);
        
        motorController.ejecutar();
	    DBConn conexion = new DBConn();
	    try {
	    	sentencia = (Statement) conexion.conn.createStatement();
	    }catch(Exception ex) {}
	     
	    
	    Tr sistemaTr = new Tr();
	    sistemaTr.setVisible(true);
	    //deleteEventRuta();
	   
	}
 
	
	public static ArrayList<String> viewParadas(){
		
		ArrayList<String> lista = new ArrayList<String>();
		String query= "SELECT * FROM st.ruta";
		
		try {
			result = sentencia.executeQuery(query); 
		} catch (Exception e){}
		try {
			while(result.next()) {
				//lista.add(result.getString("ruta"));
			}
		} catch (Exception e){}
	    return lista;	   
    }
	
	public static ArrayList<String> viewEventos(){
		
		ArrayList<String> lista = new ArrayList<String>();
		String query= "SELECT * FROM st.event";
		
		try {
			result = sentencia.executeQuery(query); 
		} catch (Exception e){}
		try {
			while(result.next()) {
				lista.add(result.getString("nombre_event"));
			}
		} catch (Exception e){}
	    return lista;	   
    }	
	
	
	public static void insertEventRuta(){	
		ArrayList<String> rutaLista = new ArrayList<String>();
		String query= "INSERT INTO st.event_parada (id_event_parada, id_event, id_ruta, estado, informe) VALUES ("+nEvent+",2,3,1,'No hay informe');";
		try {
			sentencia.executeUpdate(query); 
			nEvent++;
		} catch (Exception e){}  
			
	}
	
	
	public static ArrayList<String> viewEventRuta(){
		
		ArrayList<String> rutaLista = new ArrayList<String>();
		String query= "SELECT * FROM st.event_parada";
		
		try {
			rutaEvent = sentencia.executeQuery(query); 
			while(rutaEvent.next()) {
				rutaLista.add(rutaEvent.getString("id_event_parada"));
			}
		} catch (Exception e){}  
		
	    return rutaLista;	   
    }	
	
	
	public static void deleteEventRuta(){	
		String query="DELETE FROM st.event_parada;";
		try {
			sentencia.executeUpdate(query); 
			nEvent=1;
		} catch (Exception e){}  
    }
		
}
