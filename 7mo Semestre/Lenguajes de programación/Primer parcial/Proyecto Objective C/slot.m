#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "slot.h"

//Implementación de las funciones de un slot.
@implementation slotITF

-(NSString*)retornarCaracterCodificado:(Slot*)slot {
	if(slot->esClaveCodificada == 1)
		return slot->caracter;
	else
		return @"";
}

-(Slot*)crearCaracterAleatorio:(int)esClaveCodificada {
	int i = rand()%2 + 1;
	Slot *nuevoSlot = malloc(sizeof(Slot));
	nuevoSlot->caracter = [NSString stringWithFormat: @"%c", rand()%15 + 65];
	nuevoSlot->esClaveCodificada = esClaveCodificada;
	if(i == 1)
		nuevoSlot->caracter = [NSString stringWithFormat:@"%@%@", nuevoSlot->caracter, @"b"];
	return nuevoSlot;
}

-(Slot*)crearSlot:(NSString*)caracter enPanel:(int)panelPerteneciente posicionEnElPanel:(int)posicionEnPanel esClaveCodificada:(int)valor {
	Slot *nuevoSlot = malloc(sizeof(Slot));
	nuevoSlot->caracter = caracter;
	nuevoSlot->panelPerteneciente = panelPerteneciente;
	nuevoSlot->posicionEnPanel = posicionEnPanel;
	nuevoSlot->esClaveCodificada = valor;
	return nuevoSlot;
}

@end
