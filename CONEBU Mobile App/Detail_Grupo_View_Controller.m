//
//  Detail_Grupo_View_Controller.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 30/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "Detail_Grupo_View_Controller.h"
@interface Detail_Grupo_View_Controller()
{
}
@end
@implementation Detail_Grupo_View_Controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Grupo.text=self.Grupo_Seleccionado.Clave;
    self.Materia.text=self.Grupo_Seleccionado.Materia;
    self.Carrera.text=self.Grupo_Seleccionado.Carrera;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
