#import <FOUNDATION/FOUNDATION.H>


/*
Definicion de una estructura slot, la cual contiene un string que puede como no ser
parte de los sring que conforman una clave codificada de un usuario, de no ser asi,
el string asociado a un slot es simplemente un caracter aleatorio diferente a todos 
los string presentes en los paneles que se muestran al usuaro.
*/
typedef struct Slot {
	int panelPerteneciente;
	int posicionEnPanel;
	int esClaveCodificada;
	NSString *caracter;
}Slot;

@interface slotITF:NSObject

/*
Retorna 1 si dicho slot contiene un caracter perteneciente a una clave codificada, y retorna 0
si no es así.
*/
-(NSString*)retornarCaracterCodificado:(Slot*)slot;

/*
Genera un slot al cual se le asocia un string aleatorio que no es parte de la clave codificada de un usuario,
siempre diferente a los demás caracteres aleatorios antes formados.
*/
-(Slot*)crearCaracterAleatorio:(int)esClaveCodificada;

/*
Genera un nuevo slot en base a parametros como el caracter asociado a este, el panel al que pertenece,
la posicion que tiene en dicho panel, puede como no ser un caracter aleatorio o parte de una clave codificada.
*/
-(Slot*)crearSlot:(NSString*)caracter enPanel:(int)panelPerteneciente posicionEnElPanel:(int)posicionEnPanel esClaveCodificada:(int)valor;

@end