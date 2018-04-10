#import <FOUNDATION/FOUNDATION.H>

#define NUMPANELES 6

struct saludar {
	NSString *saludo;
	NSString grupo[NUMPANELES];
	int cont;
	struct saludar *hola;
};

@interface saludoIT:NSObject

-(struct saludar)crearSaludo;
-(void)listaArreglos:(struct saludar[])saludos;
-(void)saludo2:(struct saludar)hola;
-(NSString*)retornarPuntero;

@end

//tuneup uttilities para maximixar el rendimiento de la computadora