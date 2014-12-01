//
//  Detail_Grupo_View_Controller.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 30/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grupos.h"
@interface Detail_Grupo_View_Controller : UIViewController
@property (strong,nonatomic) Grupos *Grupo_Seleccionado;
@property (weak, nonatomic) IBOutlet UILabel *Grupo;
@property (weak, nonatomic) IBOutlet UILabel *Materia;
@property (weak, nonatomic) IBOutlet UILabel *Carrera;
@property (weak, nonatomic) IBOutlet UITableView *listViewHorario;



@end
