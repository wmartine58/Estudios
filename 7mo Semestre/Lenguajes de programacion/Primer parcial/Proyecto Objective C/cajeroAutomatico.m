#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import <math.h>
#import "cajeroautomatico.h"
#import "usuario.h"
#import "usuariomaestro.h"
#import "panel.h"
#import "slot.h"

//Implementacion de las funciones del sistema.
@implementation cajeroAutomaticoITF

-(void)iniciarBaseDatosCajero:(CajeroAutomatico*)cajeroAutomatico {
	Usuario *nuevoUsuario;
	UsuarioMaestro *nuevoUsuarioMaestro;
	cajeroAutomatico->listaUsuarios = [[NSMutableArray alloc] init];
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	
	//Se empieza a crear un registro de 10 usuarios 
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Andres" conCuenta: @"093343263" conClave: 2395 ySaldo: 757];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Clara" conCuenta: @"095674318" conClave: 6743 ySaldo: 1020];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Wilson" conCuenta: @"096653287" conClave: 9610 ySaldo: 536];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Diana" conCuenta: @"095677432" conClave: 1234 ySaldo: 678];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Oscar" conCuenta: @"092345687" conClave: 8765 ySaldo: 234];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Ronald" conCuenta: @"091230987" conClave: 4529 ySaldo: 888];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Kleber" conCuenta: @"096582133" conClave: 1092 ySaldo: 222];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Laura" conCuenta: @"098717685" conClave: 6548 ySaldo: 634];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Sofia" conCuenta: @"097223221" conClave: 1056 ySaldo: 809];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuario = [interfazUsuario nuevoUsuario: @"Javier" conCuenta: @"094598925" conClave: 4761 ySaldo: 1044];
	[cajeroAutomatico->listaUsuarios addObject: [NSValue valueWithPointer: nuevoUsuario]];
	nuevoUsuarioMaestro = [interfazUsuarioMaestro iniciarUsuarioMaestro: @"Wellington" conCuenta: @"0923071583" conClave: 9863 supervisara: cajeroAutomatico->listaUsuarios];
	cajeroAutomatico->usuarioMaestro = nuevoUsuarioMaestro;
	[interfazCajeroAutomatico presentarTodosLosUsuarios: cajeroAutomatico->listaUsuarios conUsuarioMaestro: cajeroAutomatico->usuarioMaestro];
}

-(void)menuAcceso:(CajeroAutomatico*)cajeroAutomatico {
	NSString *nombre;
	char entrada[100];
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	NSLog(@"\t\t***BIENVENIDO***");
	NSLog(@"Ingrese su tarjeta de credito (nombre de usuario):");
	scanf("%s", entrada);
	nombre = [NSString stringWithCString: entrada encoding: NSASCIIStringEncoding];
	[interfazCajeroAutomatico buscarUsuario: nombre dadaLaInterfaz: cajeroAutomatico];
}

-(void)buscarUsuario:(NSString*)nombre dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico {
	int i;
	Usuario *usuarioBuscado;
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	if([nombre isEqualToString: cajeroAutomatico->usuarioMaestro->nombre]) {
		[interfazCajeroAutomatico menuIngresoUsuarioMaestro: cajeroAutomatico->usuarioMaestro dadaLaInterfaz: cajeroAutomatico];
		NSLog(@"Gracias por usar nuestros servicios");
		return;
	}else {
		for(i = 0; i < [cajeroAutomatico->listaUsuarios count]; i++) {
			usuarioBuscado = [[cajeroAutomatico->listaUsuarios objectAtIndex: i] pointerValue];
			if([nombre isEqualToString: usuarioBuscado->nombre]) {
				[interfazCajeroAutomatico menuIngresoUsuario: usuarioBuscado dadaLaInterfaz: cajeroAutomatico];
				NSLog(@"Gracias por usar nuestros servicios");
				return;
			}else if([nombre isEqualToString: usuarioBuscado->nombre] == 0 && i == [cajeroAutomatico->listaUsuarios count] - 1) {
				NSLog(@"Usuario no registrado en el sistema");
			}
		}
	}
}

-(void)menuIngresoUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico {
	int i, secuenciaIngresada, posicion1, posicion2;
	Panel *nuevoPanel;
	Slot *caracterCodificado;
	NSString *caracter1, *caracter2,*caracter3;
	NSMutableArray *claveReconstruida;
	slotITF *interfazSlot = [[slotITF alloc] init];
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	panelITF *interfazPanel = [[panelITF alloc] init];
	cajeroAutomatico->listaPaneles = [[NSMutableArray alloc] init];
	cajeroAutomatico->listaCaracteres = [[NSMutableArray alloc] init];
	
	//creamos la interfaz que se mostrara al usuario maestro
	for(i = 0; i < TAMANIOCLAVE; i++) {
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: [[usuarioMaestro->claveCodificada objectAtIndex: i] pointerValue]]];
	}
	for(i = 0; i < TAMANIOCLAVE; i++) {
		do{
			caracter1 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuarioMaestro verificarString: caracter1 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter1]];
		
		do{
			caracter2 = [NSString stringWithFormat: @"%c%c", rand()%15 + 65, rand()%25 + 97];
		}while([interfazUsuarioMaestro verificarString: caracter2 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter2]];
	
		caracterCodificado = [interfazSlot crearSlot: [[usuarioMaestro->claveCodificada objectAtIndex: i] pointerValue]
		enPanel: i + 1 posicionEnElPanel: 0 esClaveCodificada: 1];

		nuevoPanel = [interfazPanel crearPanel: caracterCodificado siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter1 
		enPanel: i + 1 posicionEnElPanel: 1 esClaveCodificada: 0] siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter2 
		enPanel: i + 1 posicionEnElPanel: 2 esClaveCodificada: 0] yPosicion: i + 1];
		
		[cajeroAutomatico->listaPaneles addObject: [NSValue valueWithPointer: nuevoPanel]];
	}
	for(i = TAMANIOCLAVE; i < NUMEROPANELES; i++) {
		do{
			caracter1 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuarioMaestro verificarString: caracter1 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter1]];
		
		do{
			caracter2 = [NSString stringWithFormat: @"%c%c", rand()%15 + 65, rand()%25 + 97];
		}while([interfazUsuarioMaestro verificarString: caracter2 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter2]];
		
		do{
			caracter3 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuarioMaestro verificarString: caracter3 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter3]];
		
		nuevoPanel = [interfazPanel crearPanel: (Slot*)[interfazSlot crearSlot: caracter1 enPanel: i + 1 posicionEnElPanel: 0 esClaveCodificada: 0] 
		siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter2 enPanel: i + 1 posicionEnElPanel: 1 esClaveCodificada: 0] siguienteCaracter: 
		(Slot*)[interfazSlot crearSlot: caracter3 enPanel: i + 1 posicionEnElPanel: 2 esClaveCodificada: 0] yPosicion: i + 1];
		[cajeroAutomatico->listaPaneles addObject: [NSValue valueWithPointer: nuevoPanel]];
	}
	[interfazCajeroAutomatico desordenarPaneles: cajeroAutomatico->listaPaneles];
	
	//Se muestra la interfaz al usuario maestro
	do{
		i = 0;
		posicion1 = 0;
		posicion2 = 1; 
		NSLog(@"\t\t***MENU INGRESO***");
		do{
			[interfazPanel presentarPaneles: [[cajeroAutomatico->listaPaneles objectAtIndex: posicion1] pointerValue] 
			siguientePanel: [[cajeroAutomatico->listaPaneles objectAtIndex: posicion2] pointerValue]];
			posicion1 = posicion1 + 2;
			posicion2 = posicion2 + 2;
			i = i + 2;
		}while(i < NUMEROPANELES);
		
		NSLog(@"Seleccione una opcion");
		NSLog(@"[1] Ingresar clave");
		NSLog(@"[2] Salir");
		scanf("%d", &i);
		if(i == 1) {
			NSLog(@"Ingrese la secuencia numerica de los numeros que representan su clave:");
			scanf("%d", &secuenciaIngresada);
			claveReconstruida = [interfazCajeroAutomatico reconstruirClave: cajeroAutomatico->listaPaneles ingreso: secuenciaIngresada];
			if([interfazUsuarioMaestro verificarClave: cajeroAutomatico->usuarioMaestro->claveCodificada siTieneClave: claveReconstruida]) {
				[interfazUsuarioMaestro menuUsuarioMaestro: cajeroAutomatico->usuarioMaestro];
				return;
			}else
				NSLog(@"Secuencia ingresada incorrecta");
		}else
			return;
	}while(i == 1);
}

-(void)menuIngresoUsuario:(Usuario*)usuario dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico {
	int i, secuenciaIngresada, posicion1, posicion2;
	Panel *nuevoPanel;
	Slot *caracterCodificado;
	NSString *caracter1, *caracter2,*caracter3;
	NSMutableArray *claveReconstruida;
	slotITF *interfazSlot = [[slotITF alloc] init];
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	cajeroAutomaticoITF *interfazCajeroAutomatico = [[cajeroAutomaticoITF alloc] init];
	panelITF *interfazPanel = [[panelITF alloc] init];
	cajeroAutomatico->listaPaneles = [[NSMutableArray alloc] init];
	cajeroAutomatico->listaCaracteres = [[NSMutableArray alloc] init];
	
	//creamos la interfaz que se mostrara al usuario
	for(i = 0; i < TAMANIOCLAVE; i++) {
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: [[usuario->claveCodificada objectAtIndex: i] pointerValue]]];
	}
	for(i = 0; i < TAMANIOCLAVE; i++) {
		do{
			caracter1 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuario verificarString: caracter1 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter1]];
		
		do{
			caracter2 = [NSString stringWithFormat: @"%c%c", rand()%15 + 65, rand()%25 + 97];
		}while([interfazUsuario verificarString: caracter2 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter2]];
	
		caracterCodificado = [interfazSlot crearSlot: [[usuario->claveCodificada objectAtIndex: i] pointerValue]
		enPanel: i + 1 posicionEnElPanel: 0 esClaveCodificada: 1];

		nuevoPanel = [interfazPanel crearPanel: caracterCodificado siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter1 
		enPanel: i + 1 posicionEnElPanel: 1 esClaveCodificada: 0] siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter2 
		enPanel: i + 1 posicionEnElPanel: 2 esClaveCodificada: 0] yPosicion: i + 1];
		
		[cajeroAutomatico->listaPaneles addObject: [NSValue valueWithPointer: nuevoPanel]];
	}
	for(i = TAMANIOCLAVE; i < NUMEROPANELES; i++) {
		do{
			caracter1 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuario verificarString: caracter1 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter1]];
		
		do{
			caracter2 = [NSString stringWithFormat: @"%c%c", rand()%15 + 65, rand()%25 + 97];
		}while([interfazUsuario verificarString: caracter2 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter2]];
		
		do{
			caracter3 = [NSString stringWithFormat: @"%c", rand()%15 + 65];
		}while([interfazUsuario verificarString: caracter3 siEstaEn: cajeroAutomatico->listaCaracteres]);
		[cajeroAutomatico->listaCaracteres addObject: [NSValue valueWithPointer: caracter3]];
		
		nuevoPanel = [interfazPanel crearPanel: (Slot*)[interfazSlot crearSlot: caracter1 enPanel: i + 1 posicionEnElPanel: 0 esClaveCodificada: 0] 
		siguienteCaracter: (Slot*)[interfazSlot crearSlot: caracter2 enPanel: i + 1 posicionEnElPanel: 1 esClaveCodificada: 0] siguienteCaracter: 
		(Slot*)[interfazSlot crearSlot: caracter3 enPanel: i + 1 posicionEnElPanel: 2 esClaveCodificada: 0] yPosicion: i + 1];
		[cajeroAutomatico->listaPaneles addObject: [NSValue valueWithPointer: nuevoPanel]];
	}
	[interfazCajeroAutomatico desordenarPaneles: cajeroAutomatico->listaPaneles];
	
	//Se muestra la interfaz al usuario
	do{
		i = 0;
		posicion1 = 0;
		posicion2 = 1; 
		NSLog(@"\t\t***MENU INGRESO***");
		do{
			[interfazPanel presentarPaneles: [[cajeroAutomatico->listaPaneles objectAtIndex: posicion1] pointerValue] 
			siguientePanel: [[cajeroAutomatico->listaPaneles objectAtIndex: posicion2] pointerValue]];
			posicion1 = posicion1 + 2;
			posicion2 = posicion2 + 2;
			i = i + 2;
		}while(i < NUMEROPANELES);
		
		NSLog(@"Seleccione una opcion");
		NSLog(@"[1] Ingresar clave");
		NSLog(@"[2] Salir");
		scanf("%d", &i);
		if(i == 1) {
			NSLog(@"Ingrese la secuencia numerica de los numeros que representan su clave:");
			scanf("%d", &secuenciaIngresada);
			claveReconstruida = [interfazCajeroAutomatico reconstruirClave: cajeroAutomatico->listaPaneles ingreso: secuenciaIngresada];
			if([interfazUsuario verificarClave: usuario->claveCodificada siTieneClave: claveReconstruida]) {
				[interfazUsuario menuUsuario: usuario];
				return;
			}else
				NSLog(@"Secuencia ingresada incorrecta");
		}else 
			return;
	}while(i == 1);
}

-(void)desordenarPaneles:(NSMutableArray*)listaPaneles {
	int i, j, valorAleatorio;
	Panel *panelTemp;
	for(i = 0; i < NUMEROPANELES; i++) {
		valorAleatorio = rand()%5 + 1;
		panelTemp = [[listaPaneles objectAtIndex: valorAleatorio] pointerValue];
		[listaPaneles replaceObjectAtIndex: valorAleatorio withObject: [NSValue valueWithPointer:[[listaPaneles objectAtIndex: i] pointerValue]]];
		[listaPaneles replaceObjectAtIndex: i withObject: [NSValue valueWithPointer: panelTemp]];
	}
	for(i = 1; i <= NUMEROPANELES; i++) {
		panelTemp = [[listaPaneles objectAtIndex: i - 1] pointerValue];
		panelTemp->posicion = i;
		for(j = 0; j < CARACTERESPORPANEL; j++)
			((Slot*)[[panelTemp->slots objectAtIndex: j] pointerValue])->panelPerteneciente = i;
	}
}

-(NSMutableArray*)reconstruirClave:(NSMutableArray*)listaPaneles ingreso:(int)secuenciaIngresada {
	int i, j, posicion;
	NSMutableArray *claveReconstruida = [[NSMutableArray alloc] init];
	slotITF *interfazSlot = [[slotITF alloc] init];
	Panel *panel;
	Slot *slot;
	for(i = TAMANIOCLAVE - 1; i >= 0; i--) {
		posicion = (secuenciaIngresada/pow(10, i));
		posicion = posicion%10;
		if(posicion >= 1 && posicion <= NUMEROPANELES) {
			panel = [[listaPaneles objectAtIndex: posicion - 1] pointerValue];
			for(j = 0; j < [panel->slots count]; j++) {
				slot = [[panel->slots objectAtIndex: j] pointerValue];
				if([[interfazSlot retornarCaracterCodificado: slot] isEqualToString: @""] == 0) {
					[claveReconstruida addObject: [NSValue valueWithPointer: slot->caracter]];
				}else {
				}
			}
		}
	}
	for(i = [claveReconstruida count]; i < TAMANIOCLAVE; i++) {
		[claveReconstruida addObject: [NSValue valueWithPointer: @""]];
	}
	return claveReconstruida;
}

-(void)presentarTodosLosUsuarios:(NSMutableArray*)listaUsuarios conUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro {
	int i;
	Usuario *usuario;
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	NSLog(@"\t***LISTA DE USUARIOS CON SUS CLAVES***");
	for(i = 0; i <[listaUsuarios count]; i++) {
		usuario = [[listaUsuarios objectAtIndex: i] pointerValue];
		NSLog(@"Usuario %@:", usuario->nombre);
		[interfazUsuarioMaestro mostrarClaveCodificada: usuario];
	}
	NSLog(@"Usuario maestro %@:", usuarioMaestro->nombre);
	[interfazUsuarioMaestro mostrarClaveMaestra: usuarioMaestro];
}

@end