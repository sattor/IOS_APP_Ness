//
//  HomeModelH.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 01/12/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocolH <NSObject> //Protocolo de acceso a datos
-(void)itemsDownloaded:(NSArray *)items; //Arreglo de acceso a datos
@end
@interface HomeModelH : NSObject <NSURLConnectionDataDelegate> //Delegando  el objeto de conexion
@property (nonatomic, weak) id<HomeModelProtocolH> delegate; //Delegando el protocolo de conexion a id
- (void)downloadItems; //Metodo de descarga de Datos
@end
