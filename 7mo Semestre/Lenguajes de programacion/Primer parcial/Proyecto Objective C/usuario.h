#import <FOUNDATION/FOUNDATION.H>

#define TAMANIOCLAVE 4     //Tamaño de la clave de un usuario o un usuario maestro.

/*
Estructura que describe al usuario, modela su nombre, numero de cuenta, clave, su clave codificada.
*/
typedef struct Usuario {
	int clave;
	int saldo;
	NSString *nombre;
	NSString *numeroCuenta;
	NSMutableArray *claveCodificada;
}Usuario;

@interface usuarioITF:NSObject

/*
Crea un nuevo usuario en base a parametros como el nombre, su numero de cuenta, su saldo y su clave, tambien genera su clave
codificada.
*/
-(Usuario*)nuevoUsuario:(NSString*)nombre conCuenta:(NSString*)numeroCuenta conClave:(int)clave ySaldo:(int)saldo;

/*
Genera la clave codificada del usuario a partir de la clave numerica.
*/
-(NSMutableArray*)crearClaveCodificada:(int)clave;

/*
Muestra los atributos de un usuario especifico, como su nombre, numero de cuenta y su saldo.
*/
-(void)presentarUsuario:(Usuario*)usuario;

/*
Verifica si una cadena de string coincide con la cadena de string que representa la clave codificada
de un usuario específico.
*/
-(int)verificarClave:(NSMutableArray*)claveCodificada siTieneClave:(NSMutableArray*)claveIngresada;

/*
Presenta la interfaz del usuario maestro en donde se muestran las opciones de depositar, retirar y 
confirmar el saldo del mismo.
*/
-(void)menuUsuario:(Usuario*)usuario;

/*
Permite al usuaro depositar un cantidad efectiva en su cuenta.
*/
-(void)depositarSaldo:(Usuario*)usuario depositara:(int)deposito;

/*
Permite al usuaro retirar un cantidad efectiva en su cuenta, siempre y cuando no supere la cantidad existente
en la misma.
*/
-(void)retirarSaldo:(Usuario*)usuario retirara:(int)retiro;

/*
Presenta la secuencia de string que corresponde a la clave codificada de un usuario en específico.
*/
-(void)mostrarClaveCodificada:(Usuario*)usuario;

/*
Verifica si un string se encuentra n una lista de string específica.
*/
-(int)verificarString:(NSString*)caracter siEstaEn:(NSMutableArray*)listaCaracteres;

@end