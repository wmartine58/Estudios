package Familia;

public class FAmilia {
	
	Padre padre;
	
	public Familia() {
		padre = null;
	}
	
}

class Padre extends Familia {
	
	public Padre() {
		super();
	}
	
}

public static void main(String[] args) {

	Familia hijo = new Familia();
	Padre p = new Padre();	

}