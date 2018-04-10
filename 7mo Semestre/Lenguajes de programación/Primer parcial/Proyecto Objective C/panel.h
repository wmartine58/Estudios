#import <FOUNDATION/FOUNDATION.H>
#import "slot.h"

#define CARACTERESPORPANEL 3    //Muestra la cantidad de slot por panel.

/*
Definición de la estructura de un panel, el cual esta conformado por un conjunto de 3 slots
y una posición con respecto a los demas paneles que se muestran al usuario.
*/
typedef struct Panel {
	int posicion;
	NSMutableArray *slots;
}Panel;

@interface panelITF:NSObject

/*
Genera un nuevo panel a partir del ingreso de 3 slots y una posicion específica.
*/
-(Panel*)crearPanel:(Slot*)caracter1 siguienteCaracter:(Slot*)caracter2 siguienteCaracter:(Slot*)caracter3 yPosicion:(int)posicion;

/*
Imprime por pantalla la posicion y los caracteres hallados en los slots que contiene un panel.
*/
-(void)presentarPaneles:(Panel*)panel1 siguientePanel:(Panel*)panel2;

@end