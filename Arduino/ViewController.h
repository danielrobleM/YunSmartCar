//
//  ViewController.h
//  Arduino
//
//  Created by Daniel Roble on 04-05-14.
//  Copyright (c) 2014 Daniel Roble. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *Forward;
@property (weak, nonatomic) IBOutlet UIButton *Backward;
@property (weak, nonatomic) IBOutlet UISwitch *Switch;
@property (weak, nonatomic) IBOutlet UIButton *right;
@property (weak, nonatomic) IBOutlet UIButton *Left;
@property (strong,nonatomic)NSString * ipString;
@end
