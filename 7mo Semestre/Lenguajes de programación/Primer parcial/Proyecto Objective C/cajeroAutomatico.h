#import <FOUNDATION/FOUNDATION.H>
#import "usuario.h"
#import "usuariomaestro.h"
#import "panel.h"

#define NUMEROPANELES 6             //Numero maximo de paneles que se mostraran al usuario en el menu de acceso.
#define CARACTERESPORPANEL 3		//Cantidad de string que se presentarán por panel.

/*
Estructura que describe el sistema, modela las referencias hacia los usuarios existentes, el usuario maestro, los paneles que se
mostraran al usuario cuando este deee ingreasar a las funciones bridadas por el sistema.
*/
typedef struct CajeroAutomatico {
	UsuarioMaestro *usuarioMaestro;
	NSMutableArray *listaPaneles;
	NSMutableArray *listaUsuarios;
	NSMutableArray *listaCaracteres;
}CajeroAutomatico;

@interface cajeroAutomaticoITF:NSObject

/*
Esta funcion se encarga de crear un conjunto de usuarios para que el programa no empiece con
una lista vacia de los mismos, tambien genera al usuario maestro con sus respectivos atributos
y parametros y los añade a la instancia de la clase principal.
*/
-(void)iniciarBaseDatosCajero:(CajeroAutomatico*)cajeroAutomatico;

/*
Menu que permite la validacion del usuario que desea ingresar, verifica si existe en
la base de datos del programa, y de ser asi, le da acceso al mismo para que pueda 
interactuar con sus respectivas funciones.
*/
-(void)menuAcceso:(CajeroAutomatico*)cajeroAutomatico;

/*
En base a un conjunto de todos los usuarios existentes (incluyendo al usuario maestro), verifica si cierto
usuario existe en dicha información registrada mediante la comparación del nombre del mismo, con el de los demás
en la información registrada.
*/
-(void)buscarUsuario:(NSString*)nombre dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico;

/*
Función que presenta la interfaz en la que el usuario maestro deberá ingresar su clave codificada 
para poder acceder a su menu respectivo, de no ser asi se negará el acceso
a quien este intentando ingresar y se finalizará el programa.
*/
-(void)menuIngresoUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico;

/*
Función que presenta la interfaz en la que el usuario deberá ingresar su clave codificada 
para poder acceder a su menu respectivo, de no ser asi se negará el acceso
a quien este intentando ingresar y se finalizará el programa.
*/
-(void)menuIngresoUsuario:(Usuario*)usuario dadaLaInterfaz:(CajeroAutomatico*)cajeroAutomatico;

/*
Reubica en posiciones aleatorias los paneles que se mostrarán al usuario y los slots pertenecientes
a los mismos.
*/
-(void)desordenarPaneles:(NSMutableArray*)listaPaneles;

/*
En base a una secuencia numerica ingresada, esta función retornará una secuencia de string pertenecientes
a los diversos bloques que se muestran al usuario, si esta secuencia coincide con la secuencia de la clave
codificada respectiva del usuario, se permitirá el ingreso del mismo a su menu de trabajo.
*/
-(NSMutableArray*)reconstruirClave:(NSMutableArray*)listaPaneles ingreso:(int)secuenciaIngresada;

/*
Muestra la información de todos los usuarios registrados en el sistema y también muestra la información
del usuario maestro com un usuario común.
*/
-(void)presentarTodosLosUsuarios:(NSMutableArray*)listaUsuarios conUsuarioMaestro:(UsuarioMaestro*)usuarioMaestro;

@end









