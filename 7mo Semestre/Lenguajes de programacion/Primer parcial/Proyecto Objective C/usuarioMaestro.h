#import <FOUNDATION/FOUNDATION.H>
#import "usuario.h"

//#define MAXIMOUSUARIOS 100            //Cantidad máxima de usuaarios que pueden registrarse en el sistema.

/*
Estructura que describe al usuario maestro, modela su nombre, numero de cuenta, clave, su clave codificada
y la referencia a todos los usuarios existentes.
*/
typedef struct UsuarioMaestro {
	int clave;
	NSString *nombre;
	NSString *numeroCuenta;
	NSMutableArray *claveCodificada;
	NSMutableArray *listaUsuarios;
}UsuarioMaestro;

//Un usuario maestro es a la vez un usuario, por lo que hereda y puede realizar las mismas funciones que este.
@interface usuarioMaestroITF:usuarioITF

/*
Crea un usuario maestro a partir de dato específicos como el nombre, su numero de cuenta, su clave, y una referencia a
todos los usuarios registrados en el sistema.
*/
-(UsuarioMaestro*)iniciarUsuarioMaestro:(NSString*)nombre conCuenta:(NSString*)numeroCuenta conClave:(int)clave supervisara:(NSMutableArray*)listaUsuarios;

/*
Menu que muestra las diferentes opciones que tiene el usuario maestro, como crear nuevos usuarios, modificar los ya 
existentes o incluso eliminarlos.
*/
-(void)menuUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro;

/*
Funcion que permite al usuario cancelar la acción que esta llevando a cabo en ese momento.
*/
-(int)funcionCancelacion;

/*
Funcion que permite al usuario maestro crear un nuevo usuario y anexarlo a la base de datos que contiene
los demas usuarios.
*/
-(void)crearUsuario:(UsuarioMaestro*)usuarioMaestro;

/*
Funcion que permite al usuario maestro modificar los atributos un usuario existente y anexarlo a la base de datos que contiene
los demas usuarios.
*/
-(void)modificarUsuario:(UsuarioMaestro*)usuarioMaestro;

/*
Funcion que permite al usuario maestro eliminar un usuario removiendolo de la base de datos que contiene
los demas usuarios.
*/

-(void)eliminarUsuario:(UsuarioMaestro*)usuarioMaestro;

/*
Muestra la clave codificada del usuario maestro.
*/
-(void)mostrarClaveMaestra:(UsuarioMaestro*)usuarioMaestro;

@end