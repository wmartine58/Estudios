#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "cajeroautomatico.h"
#import "usuariomaestro.h"

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	srand(time(NULL));
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	CajeroAutomatico *nuevoCajeroAutomatico = malloc(sizeof(CajeroAutomatico));
	[interfazCajeroAutomatico iniciarBaseDatosCajero: nuevoCajeroAutomatico];
	[interfazCajeroAutomatico menuAcceso: nuevoCajeroAutomatico];
	[pool drain];
	
	return 0;
}

//Compilar
//gcc `gnustep-config --objc-flags` -L /GNUstep/System/Library/Librarires main.m cajeroautomatico.m usuariomaestro.m usuario.m panel.m slot.m -o main -lgnustep-base -lobjc

//Ejecutar
//./main