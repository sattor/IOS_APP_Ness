//
//  Horarios_View_Controller.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 01/12/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "Horarios_View_Controller.h"
#import "Horarios.h"
@interface Horarios_View_Controller ()
{
    HomeModelH *_homeModel;
    NSArray *_feedItems;
    Horarios *_HorarioSeleccionado;
}
@end
@implementation Horarios_View_Controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Asignar del tableView el delegado y el data source al view controller
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Creando un arreglo de objetos y asignandolo a la variable _feedItems
    _feedItems = [[NSArray alloc] init];
    
    // creando un nuevo objeto HomeModel y asignandolo a la variable _homeModel
    _homeModel = [[HomeModelH alloc] init];
    
    // Asignando a este ViewController el objeto que es el delegado del HomeModel
    _homeModel.delegate = self;
    
    // Llamar el metodo de descarga de objetos de la clase HomeModel
    [_homeModel downloadItems];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    // Este metodo de delegado es llamado cuando los objetos terminan de ser descargados
    _feedItems = items;
    
    // Recargando el table view
    [self.listTableView reloadData];
}

#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Regresando el numero de objetos descargados (Inicia en 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Generando la celda
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Tomando el item a mostrar
    Horarios *item = _feedItems[indexPath.row];
    
    // Generando las referencias de las etiquetas de la celda
    //Formando el texto a introducir
    NSString * formato_celda = [NSString stringWithFormat:@"%@ / %@ - %@ / Salon: %@",item.id_dia,item.hr_inicio,item.hr_fin,item.Salon];
    //Asignando valor a la celda
    myCell.textLabel.text = formato_celda;
    
    return myCell; // Devolviendo Celda
}

@end
