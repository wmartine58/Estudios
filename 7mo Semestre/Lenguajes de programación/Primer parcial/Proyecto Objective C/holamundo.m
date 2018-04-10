#import <FOUNDATION/FOUNDATION.H>
#include <stdio.h>
#include <conio.h>
#import "holamundo.h"
#import "slot.h"

@implementation saludoIT

-(struct saludar)crearSaludo {
	struct saludar saludo;
	saludo.saludo = @"como estas";
	return saludo;
}

-(void)saludo2:(struct saludar)hola {
	hola.saludo = @"hola, este saludo es enviado desde la clase .m";
	NSLog(@"%@", hola.saludo);
}

-(NSString*)retornarPuntero {
	struct saludar saludar;
	struct saludar saludados[NUMPANELES];
	NSString *texto;
	texto = @"escriba aqui";
	saludar.cont = 0;
	saludar.saludo = texto;
	saludados[0] = saludar;
	saludar.hola = saludados;
	return ((struct saludar)saludar.hola[0]).saludo;
}

-(void)listaArreglos:(struct saludar[])saludos {
	int i;
	struct saludar s;
	for(i = 0; i < NUMPANELES; i++) {
		s.cont = i;
		saludos[i] = s;
	}
}

@end

int main(int arg, const char *argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	/*
	srand((unsigned)time(NULL));
	int i = rand();
	NSNumber *number;
	//NSString string = (NSString)i;
	saludoIT *hola = [[saludoIT alloc] init];
	struct saludar saludoDia;
	
	NSLog(@"hola mundo");
	number = [NSNumber numberWithChar: 'b'];
	NSLog(@"%@", number);
	NSLog(@"%@", [number boolValue]);
	NSLog(@"%@", NUMPANELES);
	[hola saludo2: saludoDia];
	saludoDia = [hola crearSaludo];
	NSLog(@"%@", saludoDia.saludo);
	NSLog(@"%@", i);
	//NSLog(@"%@", string);
	*/
	/*
	int nom = 0;
	NSLog(@"Ingrese un numero:");
	scanf("%d", &nom);
	NSLog(@"Su numero es %d: ", nom);
	*/
	/*
	int i;
	NSMutableArray *arreglo;
	NSString *s = @"adios";
	
	arreglo = [NSMutableArray arrayWithObjects: @"hola", @"mundo", @"soy", @"andres", nil];
	NSLog(@"%@ %@ %@ %@", [arreglo objectAtIndex: 0], [arreglo objectAtIndex: 1], [arreglo objectAtIndex: 2], [arreglo objectAtIndex: 3]);
	for(i = 0; i < 4; i++) {
		[arreglo addObject: s];
	}
	NSLog(@"%@ %@ %@ %@", [arreglo objectAtIndex: 4], [arreglo objectAtIndex: 5], [arreglo objectAtIndex: 6], [arreglo objectAtIndex: 7]);
	*/
	int i;
	char c[20];
	NSString *s;
	NSMutableArray *arreglo = [NSMutableArray new];
	Slot *nuevoslot = malloc(sizeof(Slot));
	nuevoslot->caracter = @"Andres";
	for(i = 0; i < 2; i++) {
		scanf("%s", c);
		s = [NSString stringWithCString: c encoding: NSASCIIStringEncoding];
		nuevoslot->caracter = s;
		[arreglo addObject:[NSValue valueWithPointer: nuevoslot]];
		NSLog(@"Anexando %i", i + 1);
	}
	nuevoslot = [[arreglo objectAtIndex:0] pointerValue];
	nuevoslot = [[arreglo objectAtIndex:1] pointerValue];
	NSLog(@"%@", nuevoslot->caracter);
	[pool drain];
	return 0;
}

//Compilar:
//gcc `gnustep-config --objc-flags` -L /GNUstep/System/Library/Libraries holamundo.m -o holamundo -lgnustep-base -lobjc

//Ejecutar:
//./holamundo

//alcance de extern para otros archivos