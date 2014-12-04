//
//  PrincipalMenu_ViewController.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 01/12/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "PrincipalMenu_ViewController.h"

@implementation PrincipalMenu_ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString * formato_etiqueta = [NSString stringWithFormat:@"Professor: %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"matricula"]];
    self.lbl_profesor.text=formato_etiqueta;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
