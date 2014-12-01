//
//  Login_ViewController.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 30/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login_ViewController : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *UserName;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *Password;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *btn_login;
@property (nonatomic, retain) IBOutlet UIView *mrView;

@end
