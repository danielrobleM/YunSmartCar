//
//  iPViewController.m
//  Arduino
//
//  Created by Daniel Roble on 10-05-14.
//  Copyright (c) 2014 Daniel Roble. All rights reserved.
//

#import "iPViewController.h"
#import "ViewController.h"
@interface iPViewController ()

@end

@implementation iPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//[[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:32.0f/255.0f green:134.0f/255.0f blue:138.0f/255.0f alpha:1];
    self.navigationController.navigationController.navigationBar.translucent=NO;
//    self.navigationController.navigationBar.barTintColor
//[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];}
    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextView:(id)sender {
 
    [self performSegueWithIdentifier:@"NextView" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ViewController * NextViewController=[segue destinationViewController];
    NextViewController.ipString=_iPTextField.text;
}


@end
