//
//  Grupos_ViewController.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 29/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Grupos_ViewController : UIViewController
{
IBOutlet UITableView *table_view_grupos;
}
@property(nonatomic,strong) NSArray *Grupos;
@end
