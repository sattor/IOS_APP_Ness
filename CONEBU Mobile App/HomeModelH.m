//
//  HomeModelH.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 01/12/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "HomeModelH.h"
#import "Horarios.h"
@interface HomeModelH()
{
    NSMutableData *_downloadedData;
}
@end
@implementation HomeModelH
- (void)downloadItems
{
 //mandando al log para debugeo
    //generando string de conexion a URL de servicio web
    NSString * formato_url = [NSString stringWithFormat:@"%@IOS_DetalleGrupo.php?Clave=%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"url"],[[NSUserDefaults standardUserDefaults] valueForKey:@"claveSalon"]];
    
    // Descarga de datos JSON
    NSURL *jsonFileUrl = [NSURL URLWithString:formato_url];
    // Creando la peticion
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // creando la conexion NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}
#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Inicializando el objeto de Datos
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Mapeando los nuevos datos descargados
    [_downloadedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Creando el Arreglo para alojar datos
    NSMutableArray *_Horarios = [[NSMutableArray alloc] init];
    
    // Parseando el JSON que se descargo
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Ciclo para llenar el arreglo de datos con el JSON mapeado
    for (int i = 0; i < jsonArray.count; i++)
    {
        //Primera fila del arreglo mapeado
        NSArray *firstItemArray = jsonArray[i];
        // creando nuevo objeto para alojar datos y propiedades del objeto JSON
        Horarios *newHorario = [[Horarios alloc] init];
        NSString *id_dia=firstItemArray[0];
        if([id_dia isEqual:@"1"])
            newHorario.id_dia=@"Lunes";
        else if([id_dia isEqual:@"2"])
            newHorario.id_dia=@"Martes";
        else if([id_dia isEqual:@"3"])
            newHorario.id_dia=@"Miercoles";
        else if([id_dia isEqual:@"4"])
            newHorario.id_dia=@"Jueves";
        else if([id_dia isEqual:@"5"])
            newHorario.id_dia=@"Viernes";

        newHorario.hr_inicio=firstItemArray[1];
        newHorario.hr_fin=firstItemArray[2];
        newHorario.Salon=firstItemArray[3];
        
        // Añadiendo el nuevo Objeto generado al arreglo de Datos
        [_Horarios addObject:newHorario];
    }
    
    // Notificando al delegado principal que los datos han sido decodificados
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_Horarios];
    }
}

@end
