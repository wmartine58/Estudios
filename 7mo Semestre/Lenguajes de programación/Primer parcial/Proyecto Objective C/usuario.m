#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "usuario.h"

//Implementacion de las funciones de un usuario.
@implementation usuarioITF

-(Usuario*)nuevoUsuario:(NSString*)nombre conCuenta:(NSString*)numeroCuenta conClave:(int)clave ySaldo:(int)saldo {
	Usuario *nuevoUsuario = malloc(sizeof(Usuario));
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	nuevoUsuario->claveCodificada = [[NSMutableArray alloc] init];
	nuevoUsuario->nombre = nombre;
	nuevoUsuario->numeroCuenta = numeroCuenta;
	nuevoUsuario->clave = clave;
	nuevoUsuario->claveCodificada = [interfazUsuario crearClaveCodificada: clave];
	nuevoUsuario->saldo = saldo;
	return nuevoUsuario;
}

-(NSMutableArray*)crearClaveCodificada:(int)clave {
	NSString *segmento = @"hola";
	NSMutableArray *claveCodificada = [[NSMutableArray alloc] init];
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	int posicion1, posicion2, posicion3, posicion4, calculo = 0;
	posicion4 = clave%10;
	posicion3 = (clave/10)%10;
	posicion2 = (clave/100)%10;
	posicion1 = (clave/1000)%10;
	
	calculo = posicion1*posicion2 + posicion3;
	do{
		if(calculo < 65) {
			calculo = calculo + 2*posicion4 + posicion1 + posicion2 + posicion3;
		}else if(calculo > 90) {
			calculo = calculo + posicion4 + posicion1 - 20;
		}
		if(calculo >= 65 && calculo <= 90) {
			segmento = [NSString stringWithFormat: @"%c", calculo];
			if(posicion1%2 != 0) {
				segmento = [NSString stringWithFormat: @"%@%@", segmento, [NSString stringWithFormat: @"%c", rand()%25 + 97]];
			}
		}
	}while((calculo >= 65 && calculo <= 90) == 0);
	[claveCodificada addObject: [NSValue valueWithPointer: segmento]];
	
	calculo = 4*posicion3 + 2*posicion2 + 3*(posicion1 - posicion2);
	do{
		if(calculo < 65) {
			calculo = calculo + 4*posicion3 + 2*posicion2 + 3*(posicion1 - posicion2);
		}else if(calculo > 90) {
			calculo = calculo - posicion1 - posicion4 + posicion3 - 10;
		}
		if(calculo >= 65 && calculo <= 90) {
			segmento = [NSString stringWithFormat: @"%c", calculo];
			if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {
				calculo = calculo + 4*posicion3 + 2*posicion2 + 3*(posicion1 - posicion2);
			}else if(posicion2%2 != 0) {
				segmento = [NSString stringWithFormat: @"%@%@", segmento, [NSString stringWithFormat: @"%c", rand()%25 + 97]];
				if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {
					calculo = calculo + 4*posicion3 + 2*posicion2 + 3*(posicion1 - posicion2);
				}
			}
		}
	}while(((calculo >= 65 && calculo <= 90) == 0) || [interfazUsuario verificarString: segmento siEstaEn: claveCodificada]);
	[claveCodificada addObject: [NSValue valueWithPointer: segmento]];
	
	calculo = 3*posicion4 + posicion1 + 2*posicion3 - 5;
	do{
		if(calculo < 65) {
			calculo = calculo +3*posicion4 + posicion1 + 2*posicion3 - 5;
		}else if(calculo > 90) {
			calculo = calculo - posicion3 + posicion2 - posicion1 - 9;
		}
		if(calculo >= 65 && calculo <= 90) {
			segmento = [NSString stringWithFormat: @"%c", calculo];
			if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {
				calculo = calculo + 3*posicion4 + posicion1 + 2*posicion3 - 5;
			}else if(posicion3%2 != 0) {
				segmento = [NSString stringWithFormat: @"%@%@", segmento, [NSString stringWithFormat: @"%c", rand()%25 + 97]];
				if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {

					calculo = calculo + 3*posicion4 + posicion1 + 2*posicion3 - 5;
				}
			}
		}
	}while(((calculo >= 65 && calculo <= 90) == 0) || [interfazUsuario verificarString: segmento siEstaEn: claveCodificada]);
	[claveCodificada addObject: [NSValue valueWithPointer: segmento]];
	
	calculo = posicion4 + 2*posicion1 + 3*posicion3 - 5;
	do{
		if(calculo < 65) {
			calculo = calculo + posicion4 + 2*posicion1 + 3*posicion3 - 5;
		}else if(calculo > 90) {
			calculo = calculo - posicion2 - posicion4 - 2*posicion1;
		}
		if(calculo >= 65 && calculo <= 90) {
			segmento = [NSString stringWithFormat: @"%c", calculo];
			if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {
				calculo = calculo + posicion4 + 2*posicion1 + 3*posicion3 - 5;
			}else if(posicion4%2 != 0) {
				segmento = [NSString stringWithFormat: @"%@%@", segmento, [NSString stringWithFormat: @"%c", rand()%25 + 97]];
				if([interfazUsuario verificarString: segmento siEstaEn: claveCodificada]) {
					calculo = calculo + posicion4 + 2*posicion1 + 3*posicion3 - 5;
				}
			}
		}
	}while(((calculo >= 65 && calculo <= 90) == 0) || [interfazUsuario verificarString: segmento siEstaEn: claveCodificada]);
	[claveCodificada addObject: [NSValue valueWithPointer: segmento]];
	
	return claveCodificada;
}

-(int)verificarClave:(NSMutableArray*)claveCodificada siTieneClave:(NSMutableArray*)claveIngresada {
	int i;
	for(i = 0; i < TAMANIOCLAVE; i++) {
		if([(NSString*)[[claveCodificada objectAtIndex: i] pointerValue] 
		isEqualToString: (NSString*)[[claveIngresada objectAtIndex: i] pointerValue]] == 0)
			return 0;
	}
	return 1;
}

-(void)presentarUsuario:(Usuario*)usuario {
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	NSLog(@"Nombre: %@   Numero de cuenta: %@   Saldo: %d   clave: %d", usuario->nombre, 
	usuario->numeroCuenta, usuario->saldo, usuario->clave);
	NSLog(@"Clave codificada asociada:");
	[interfazUsuario mostrarClaveCodificada: usuario];
	NSLog(@"");
}

-(void)menuUsuario:(Usuario*)usuario {
	int op, valor;
	usuarioITF *interfazUsuario = [[usuarioITF alloc] init];
	do {
	NSLog(@"\t\tMENU PRINCIPAL");
	NSLog(@" [1] Consultar saldo actual  Depositar [2]");
	NSLog(@" [3] Retirar                     Salir [4]");
	scanf("%d", &op);
		switch(op){
			case 1:
				NSLog(@"Su saldo actual es $%d", usuario->saldo);
			break;
			case 2:
				NSLog(@"Ingrese la cantidad que desea depositar:");
				scanf("%d", &valor);
					[interfazUsuario depositarSaldo: usuario depositara: valor];
			break;
			case 3:
				NSLog(@"Ingrese la cantidad que desea retirar:");
				scanf("%d", &valor);
					[interfazUsuario retirarSaldo: usuario retirara: valor];
			break;
			default:
			break;
		}
	}while(op<4);
}

-(void)depositarSaldo:(Usuario*)usuario depositara:(int)deposito {
	usuario->saldo = usuario->saldo + deposito;
	NSLog(@"Su saldo actual es $%d", usuario->saldo);
}

-(void)retirarSaldo:(Usuario*)usuario retirara:(int)retiro {
	int temp = usuario->saldo;
	if(usuario->saldo < retiro) {
		NSLog(@"Esta tratando de retirar una cantidad mayor que su saldo actual");
		return;
	}else {
		temp = temp - retiro;
		usuario->saldo = temp;
		NSLog(@"Ha retirado $%d, su saldo actual es $%d", retiro, temp);
	}
}
                 
-(void)mostrarClaveCodificada:(Usuario*)usuario {
	NSLog(@"%@ %@ %@ %@", (NSString*)[[usuario->claveCodificada objectAtIndex: 0] pointerValue], 
	(NSString*)[[usuario->claveCodificada objectAtIndex: 1] pointerValue],
	(NSString*)[[usuario->claveCodificada objectAtIndex: 2] pointerValue], 
	(NSString*)[[usuario->claveCodificada objectAtIndex: 3] pointerValue]);
}

-(int)verificarString:(NSString*)caracter siEstaEn:(NSMutableArray*)listaCaracteres {
	int i;
	for(i = 0; i <[listaCaracteres count]; i++) {
		if ([caracter isEqualToString: [[listaCaracteres objectAtIndex: i] pointerValue]]) {
			return 1;
		}
	}
	return 0;
}

@end