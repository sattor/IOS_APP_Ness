//
//  Login_ViewController.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 30/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "Login_ViewController.h"
#import "Grupos_VIew_Controller.h"
@implementation Login_ViewController
- (IBAction)login:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://localhost/webservice/wbs_login.php"];
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
        NSString *matricula=self.UserName.text;
        NSString *json_resp;
        for (int i=0;i<array.count;i++)
        {
            NSArray *firstItemArray = array[i];
            json_resp=firstItemArray[0];
        }
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"matricula"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        // etc.
        if([json_resp isEqual:@"1"])
        {
            [[NSUserDefaults standardUserDefaults]setObject:matricula forKey:@"matricula"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"username saved = %@", matricula);
           //[self performSegueWithIdentifier:@"login" sender:self];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
        });
    });
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"login"]) {
        Grupos_VIew_Controller *purchaseContr = [segue
                                                  destinationViewController];    }
}
@end
