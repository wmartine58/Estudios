#import <FOUNDATION/FOUNDATION.H>
#import <conio.h>
#import <stdlib.h>
#import <time.h>
#import "usuariomaestro.h"
#import "usuario.h"

//Implementacion de las funciones de un usuario maestro.
@implementation usuarioMaestroITF

-(UsuarioMaestro*)iniciarUsuarioMaestro:(NSString*)nombre conCuenta:(NSString*)numeroCuenta conClave:(int)clave supervisara:(NSMutableArray*)listaUsuarios {
	UsuarioMaestro *nuevoUsuarioMaestro = malloc(sizeof(UsuarioMaestro));
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	nuevoUsuarioMaestro->nombre = nombre;
	nuevoUsuarioMaestro->numeroCuenta = numeroCuenta;
	nuevoUsuarioMaestro->clave = clave;
	nuevoUsuarioMaestro->claveCodificada = [interfazUsuarioMaestro crearClaveCodificada: clave];
	nuevoUsuarioMaestro->listaUsuarios = listaUsuarios;
	return nuevoUsuarioMaestro;
}

-(void)menuUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro {
	int op;
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	do {
		NSLog(@"\t\t***MENU PRINCIPAL***");
		NSLog(@" [1] Crear usuario         Modificar usuario [2]");
		NSLog(@" [3] Eliminar usuario                  Salir [4]");
		scanf("%d", &op);
		switch(op) {
			case 1:
				[interfazUsuarioMaestro crearUsuario: usuarioMaestro];
			break;
			case 2:
				[interfazUsuarioMaestro modificarUsuario: usuarioMaestro];
			break;
			case 3:
				[interfazUsuarioMaestro eliminarUsuario: usuarioMaestro];
			break;
			default:
			break;
		}
	}while(op<4);
}

-(int)funcionCancelacion {
	int op = 2;
	NSLog(@"Desea cancelar el proceso actual:");
	NSLog(@" [1] Si         No [2] ");
	scanf("%d", &op);
	return op;
}

-(void)crearUsuario:(UsuarioMaestro*)usuarioMaestro {
	int clave, saldo;
	char nombreTmp[100], numeroCuentaTmp[100];
	NSString *nombre, *numeroCuenta;
	Usuario *nuevoUsuario;
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	NSLog(@"Ingrese el nombre del usuario:");
	scanf("%s", nombreTmp);
	if([interfazUsuarioMaestro funcionCancelacion] == 1)
		return;
	NSLog(@"Ingrese el numero de cuenta del usuario:");
	scanf("%s", numeroCuentaTmp);
	if([interfazUsuarioMaestro funcionCancelacion] == 1)
		return;
	do{
		NSLog(@"Ingrese la clave del usuario, debe tener 4 digitos:");
		scanf("%d", &clave);
		if([interfazUsuarioMaestro funcionCancelacion] == 1)
			return;
		if((clave < 1000 || clave > 9999) == 1)
			NSLog(@"Formato de la clave del usuario incorrecto, debe tener 4 digitos");
	}while(clave < 1000 || clave > 9999);
	NSLog(@"Ingrese el saldo del usuario:");
	scanf("%d", &saldo);
	if([interfazUsuarioMaestro funcionCancelacion] == 1)
		return;
	nombre = [NSString stringWithCString: nombreTmp encoding: NSASCIIStringEncoding];
	numeroCuenta = [NSString stringWithCString: numeroCuentaTmp encoding: NSASCIIStringEncoding];
	nuevoUsuario = [interfazUsuarioMaestro nuevoUsuario: nombre conCuenta: numeroCuenta conClave: clave ySaldo: saldo];
	[usuarioMaestro->listaUsuarios addObject:[NSValue valueWithPointer: nuevoUsuario]];
	NSLog(@"Usuario creado correctamente");
}

-(void)modificarUsuario:(UsuarioMaestro*)usuarioMaestro {
	int i, op;
	char entrada[100];
	NSString *temp;
	Usuario *usuarioModificado;
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	NSLog(@"\t\t***LISTA DE USUARIOS***");
	for(i = 0; i < [usuarioMaestro->listaUsuarios count]; i++) {
		NSLog(@"Usuario [%d]: ", i + 1);
		[interfazUsuarioMaestro presentarUsuario: [[usuarioMaestro->listaUsuarios objectAtIndex: i] pointerValue]];
	}
	NSLog(@"Seleccione el usuario que desea modificar:");
	scanf("%d", &i);
	if(i >= 1 && i <= [usuarioMaestro->listaUsuarios count]) {
		usuarioModificado = [[usuarioMaestro->listaUsuarios objectAtIndex: i - 1] pointerValue];
		do{
			NSLog(@"Seleccione el parametro que desea modificar:");
			NSLog(@"[1] Nombre     Numero de cuenta [2]");
			NSLog(@"[3] clave                 Saldo [4]");
			NSLog(@"[5] Salir");
			scanf("%d", &op);
			if(op == 1) {
				NSLog(@"Ingrese el nuevo nombre:");
				scanf("%s", entrada);
				if([interfazUsuarioMaestro funcionCancelacion] == 1)
					return;
				temp = [NSString stringWithCString: entrada encoding: NSASCIIStringEncoding];
				usuarioModificado->nombre = temp;
			}else if(op == 2) {
				NSLog(@"Ingrese el nuevo numero de cuenta:");
				scanf("%s", entrada);
				if([interfazUsuarioMaestro funcionCancelacion] == 1)
					return;
				temp = [NSString stringWithCString: entrada encoding: NSASCIIStringEncoding];
				usuarioModificado->numeroCuenta = temp;
			}else if(op == 3) {
				do{
					NSLog(@"Ingrese la nueva clave (debe tener 4 digitos):");
					scanf("%d", &op);
					if([interfazUsuarioMaestro funcionCancelacion] == 1)
						return;
					if((op < 1000 || op > 9999) == 1)
						NSLog(@"Formato de la clave del usuario incorrecto, debe tener 4 digitos");
				}while(op < 1000 || op > 9999);
				usuarioModificado->clave = op;
				usuarioModificado->claveCodificada = [interfazUsuarioMaestro crearClaveCodificada: op];
				NSLog(@"La nueva clave codificada asociada a este usuario es:");
				[interfazUsuarioMaestro mostrarClaveCodificada: usuarioModificado];
			}else if(op == 4) {
				NSLog(@"Ingrese el saldo:");
				scanf("%d", &op);
				if([interfazUsuarioMaestro funcionCancelacion] == 1)
					return;
				usuarioModificado->saldo = op;
			}else
				return;
		}while(true);
	}else
		NSLog(@"El usuario al que desea acceder no existe");
}

-(void)eliminarUsuario:(UsuarioMaestro*)usuarioMaestro {
	int i;
	usuarioMaestroITF *interfazUsuarioMaestro = [[usuarioMaestroITF alloc] init];
	NSLog(@"\t\t***LISTA DE USUARIOS***");
	for(i = 0; i < [usuarioMaestro->listaUsuarios count]; i++) {
		NSLog(@"\tUsuario [%d]:", i + 1);
		[interfazUsuarioMaestro presentarUsuario: [[usuarioMaestro->listaUsuarios objectAtIndex: i] pointerValue]];
	}
	NSLog(@"Seleccione el usuario que desea eliminar:");
	scanf("%d", &i);
	if([interfazUsuarioMaestro funcionCancelacion] == 1)
		return;
	if(i >= 1 && i <= [usuarioMaestro->listaUsuarios count]) {
		[usuarioMaestro->listaUsuarios removeObjectAtIndex: i - 1];
		NSLog(@"El usuario ha sido eliminado correctamente");
	}else
		NSLog(@"El usuario al que desea acceder no existe");
}

-(void)mostrarClaveMaestra:(UsuarioMaestro*)usuarioMaestro {
	NSLog(@"%@ %@ %@ %@", (NSString*)[[usuarioMaestro->claveCodificada objectAtIndex: 0] pointerValue], (NSString*)[[usuarioMaestro->claveCodificada objectAtIndex: 1] pointerValue],
	(NSString*)[[usuarioMaestro->claveCodificada objectAtIndex: 2] pointerValue], (NSString*)[[usuarioMaestro->claveCodificada objectAtIndex: 3] pointerValue]);
}

@end