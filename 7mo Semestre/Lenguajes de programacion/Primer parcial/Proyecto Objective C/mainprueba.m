#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "slot.h"
#import "panel.h"
#import "usuario.h"
#import "usuariomaestro.h"
#import "cajeroautomatico.h"

int main(){
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	/*
	int i;
	NSArray *arreglo;
	struct slot nuevoSlot;
	for(i = 0; i < 10; i++) {
		arreglo[i] = nuevoSlot;
	}
	*/
	/*
	struct slot slot1;
	panelITF *itfpanel = [[panelITF alloc] init];
	struct panel panel1;
	slot1.esClaveCodificada = 1;
	slot1.caracter = @"Si";
	panel1 = [itfpanel crearPanel: slot1 siguienteCaracter: slot1 siguienteCaracter: slot1 yPosicion: 1];
	[itfpanel presentarPanel: panel1];
	*/
	/*
	NSString *s;
	char c[20] = "hola";
	int i = 0;
	NSLog(@"Ingrese un numero:");
	scanf("%d", &i);
	NSLog(@"El numero ingresado es: %d", i);
	s = [NSString stringWithCString: c encoding: NSASCIIStringEncoding];
	NSLog(@"%@", s);
	*/
	/*
	int i;
	NSString *nombre1 = @"Andres", *nombre2;
	char entrada[100];
	NSLog(@"Ingrese su nombre:");
	scanf("%s", entrada);
	nombre2 = [NSString stringWithCString: entrada encoding: NSASCIIStringEncoding];
	i = [nombre1 isEqualToString: nombre2];
	NSLog(@"%d", i);
	if(i) {
		NSLog(@"Nombres ingresados identicos");
	}else{
		NSLog(@"Nombre incorrecto");
	}
	*/
	/*
	srand(time(NULL));
	unichar ascii = 97;
	NSString *conversion = [NSString stringWithCharacters: &ascii length: 2];
	NSLog(@"%@", conversion);
	*/
	/*
	int i;
	for(i = 0; i < 10; i++) {
		NSString *s = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		NSLog(@"%@", s);
	}
	*/
	/*
	int i;
	Slot *caracterCodificado = malloc(sizeof(Slot));
	NSMutableArray *lista= [[NSMutableArray alloc] init];
	
	//creamos la interfaz que se mostrara al usuario
	i = 1234;
	Slot *element;
	int pos1 = (i/100)%10;
	NSLog(@"%d", pos1);
	caracterCodificado->caracter = [NSString stringWithFormat: @"%c", rand()%15 + 65];
	[lista addObject: [NSValue valueWithPointer: caracterCodificado]];
	for(i = 0; i < 2; i++) {
		element = [[lista objectAtIndex: 0] pointerValue];
		NSLog(@"Anexado %d", i);
		NSLog(@"[%d] %@", i, element->caracter);
	}
	caracterCodificado->caracter = [NSString stringWithFormat: @"%c", rand()%15 + 65];
	[lista replaceObjectAtIndex: 0 withObject: [NSValue valueWithPointer: caracterCodificado]];
	element = [[lista objectAtIndex: 0] pointerValue];
	NSLog(@"[%d] %@", i, element->caracter);
	//NSString *myString = [NSString stringWithFormat:@"%@%@", @"a", @"b"];
	//NSLog(@"%@", myString);
	*/
	NSString *segmento = [NSString stringWithFormat: @"%c", rand()%10 + 45];
	segmento = [NSString stringWithFormat:@"%@%@", segmento, @"b"];
	NSLog(@"%@", segmento);
	[pool drain];
	return 1;
}

//gcc `gnustep-config --objc-flags` -L /GNUstep/System/Library/Libraries mainprueba.m -o mainprueba -lgnustep-base -lobjc
//Capitulo 1: Historia d los lenguajes, k es ortogonalidad para lenguajes d program