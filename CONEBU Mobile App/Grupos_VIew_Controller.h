//
//  Grupos_VIew_Controller.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 30/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface Grupos_VIew_Controller : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end
