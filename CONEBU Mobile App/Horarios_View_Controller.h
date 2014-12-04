//
//  Horarios_View_Controller.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 01/12/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModelH.h"
@interface Horarios_View_Controller : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocolH> // //Asignando los metodos del protocolo de Datos
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end
