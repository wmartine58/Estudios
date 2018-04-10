#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "panel.h"
#import "slot.h"

//Implementacion de las funciones de un panel.
@implementation panelITF


-(Panel*)crearPanel:(Slot*)caracter1 siguienteCaracter:(Slot*)caracter2 siguienteCaracter:(Slot*)caracter3 yPosicion:(int)posicion {
	int i  = rand()%3 + 1;
	Panel *nuevoPanel = malloc(sizeof(Panel));
	nuevoPanel->slots = [[NSMutableArray alloc] init];
	
	if(i == 1) {
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter1]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter2]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter3]];
	}else if(i == 2) {
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter3]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter1]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter2]];
	}else {
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter2]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter3]];
		[nuevoPanel->slots addObject:[NSValue valueWithPointer: caracter1]];
	}
	
	nuevoPanel->posicion = posicion;
	return nuevoPanel;
}

-(void)presentarPaneles:(Panel*)panel1 siguientePanel:(Panel*)panel2 {
	NSLog(@"[%d] %@\t%@\t%@\t%@\t%@\t%@ [%d]",panel1->posicion, ((Slot*)[[panel1->slots objectAtIndex: 0] pointerValue])->caracter, 
	((Slot*)[[panel1->slots objectAtIndex: 1] pointerValue])->caracter, ((Slot*)[[panel1->slots objectAtIndex: 2] pointerValue])->caracter, 
	((Slot*)[[panel2->slots objectAtIndex: 0] pointerValue])->caracter, ((Slot*)[[panel2->slots objectAtIndex: 1] pointerValue])->caracter, 
	((Slot*)[[panel2->slots objectAtIndex: 2] pointerValue])->caracter, panel2->posicion);
}

@end