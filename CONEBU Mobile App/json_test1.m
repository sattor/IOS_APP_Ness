//
//  Grupos_ViewController.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 29/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "Grupos_ViewController.h"
#import "Grupos.h"
@interface Grupos_ViewController ()
{
    NSMutableArray *grupos_array;
}
@end

@implementation Grupos_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadJSON];
    [table_view_grupos reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadJSON
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.108/webservice/index.php?op=1"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
        if (error)
        {
            NSLog(@"%s: dataWithContentsOfURL error: %@", __FUNCTION__, error);
            return;
        }
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error)
        {
            NSLog(@"%s: JSONObjectWithData error: %@", __FUNCTION__, error);
            return;
        }
        grupos_array=[[NSMutableArray alloc]init];

        for (int i=0;i<array.count;i++)
        {
            NSArray *firstItemArray = array[i];
            Grupos *nuevo_grupo=[[Grupos alloc]init];
            nuevo_grupo.Clave=firstItemArray[0];
            nuevo_grupo.Materia=firstItemArray[1];
            [grupos_array addObject:nuevo_grupo];
        }

        // etc.
        
        dispatch_async(dispatch_get_main_queue(), ^{
        });
    });
}
#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return grupos_array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get references to labels of cell
    myCell.textLabel.text = [grupos_array valueForKey:@"clave"];
    //myCell.detailTextLabel.text=item.Materia;
    
    return myCell;
}

@end
