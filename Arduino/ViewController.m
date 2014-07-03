//
//  ViewController.m
//  Arduino
//
//  Created by Daniel Roble on 04-05-14.
//  Copyright (c) 2014 Daniel Roble. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString * forwardFast;
    NSString * forwardSlow;
    NSString * backwardFast;
    NSString * backwardSlow;
    NSString * leftFast;
    NSString * leftSlow;
    NSString * rightFast;
    NSString * rightSlow;
    NSString * mode;
    Boolean canSend;
    Boolean slowMode;
}
@property NSMutableData *responseData;
@property NSURLConnection * conn;
@property NSTimer * timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    NSLog(@"%@",_ipString);
    forwardFast=[NSString stringWithFormat:@"http://%@/arduino/forward/fast",_ipString];
    forwardSlow=[NSString stringWithFormat:@"http://%@/arduino/forward/slow",_ipString];
    backwardFast=[NSString stringWithFormat:@"http://%@/arduino/backward/fast",_ipString];
    backwardSlow=[NSString stringWithFormat:@"http://%@/arduino/backward/slow",_ipString];
    leftFast=[NSString stringWithFormat:@"http://%@/arduino/left/fast",_ipString];
    leftSlow=[NSString stringWithFormat:@"http://%@/arduino/left/slow",_ipString];
    rightFast=[NSString stringWithFormat:@"http://%@/arduino/right/fast",_ipString];
    rightSlow=[NSString stringWithFormat:@"http://%@/arduino/right/slow",_ipString];
    canSend = TRUE;
    mode=@"";
    slowMode = FALSE;
}
//* "/arduino/forward/fast"        -> The car moves forward, normal speed.
//* "/arduino/forward/slow"        -> The car moves forward, parking mode.
//* "/arduino/backward/fast"       -> The car moves backward, normal speed.
//* "/arduino/backward/slow"       -> The car moves backward, parking mode
//* "/arduino/left/fast"           -> The car goes left, normal speed.
//* "/arduino/left/slow"           -> The car goes left, parking mode
//* "/arduino/right/fast"          -> The car goes right, normal speed.
//* "/arduino/right/slow"          -> The car goes right, parking mode
#pragma mark Forward
- (IBAction)Forward:(id)sender {
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"forward"]) {
    mode = @"forward";
    [self ForwardGet];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(ForwardGet) userInfo:nil repeats:YES];
    }
}
-(void)ForwardGet{
//    NSLog(@"touch");
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"forward"]) {
    mode = @"forward";
    NSURL *url;
    if (_Switch.on) {
    url = [NSURL URLWithString:forwardSlow];
        }else{
    url = [NSURL URLWithString:forwardFast];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3];
    [request setHTTPMethod:@"GET"];
    self.conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.conn start];
    }
    
}
- (IBAction)SendGetForward:(UIButton *)sender {
    mode = @"";
    if (self.timer != nil){
        [self.timer invalidate];}else{
            [self ForwardGet];
        }
    self.timer = nil;
}
#pragma mark Backward

-(void)encederLed{
//    NSLog(@"touch");
if ([mode isEqualToString:@""] || [mode isEqualToString:@"Backward"]) {
    mode = @"Backward";
    NSURL *url;
    if (_Switch.on) {
        url = [NSURL URLWithString:backwardSlow];
    }else{
        url = [NSURL URLWithString:backwardFast];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3];
    [request setHTTPMethod:@"GET"];
    self.conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.conn start];
    }
}

- (IBAction)Backward:(id)sender {
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"Backward"]) {
        mode = @"Backward";
    [self encederLed];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(encederLed) userInfo:nil repeats:YES];
    }
}

- (IBAction)SendGetBackward:(id)sender {
    mode = @"";
    if (self.timer != nil){
        [self.timer invalidate];
        }else{
        [self encederLed];
        }
    self.timer = nil;
    
}

#pragma mark Left

- (IBAction)Left:(id)sender {
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"left"]) {
    mode = @"left";
    [self LeftGet];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(LeftGet) userInfo:nil repeats:YES];
    }
}
-(void)LeftGet{
    //    NSLog(@"touch");
if ([mode isEqualToString:@""] || [mode isEqualToString:@"left"]) {
    mode=@"left";
    NSURL *url;
    if (_Switch.on) {
        url = [NSURL URLWithString:leftFast];
    }else{
        url = [NSURL URLWithString:leftSlow];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3];
    [request setHTTPMethod:@"GET"];
    self.conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.conn start];
    }
}
- (IBAction)SendGetLeft:(id)sender {
    mode=@"";
    if (self.timer != nil){
        [self.timer invalidate];
        }else{
            [self LeftGet];
        }
    self.timer = nil;
}

#pragma mark right
- (IBAction)Right:(id)sender {
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"right"]) {
        mode = @"right";
    [self RightGet];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(RightGet) userInfo:nil repeats:YES];
    }
}
-(void)RightGet{
    //    NSLog(@"touch");
    if ([mode isEqualToString:@""] || [mode isEqualToString:@"right"]) {
    mode=@"right";
    NSURL *url;
    if (_Switch.on) {
        url = [NSURL URLWithString:rightSlow];
    }else{
        url = [NSURL URLWithString:rightFast];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3];
    [request setHTTPMethod:@"GET"];
    self.conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.conn start];
    }
}
- (IBAction)SendGetRight:(id)sender {
    mode=@"";
    if (self.timer != nil){
        [self.timer invalidate];
    }else{
        [self RightGet];
    }
    self.timer = nil;
}


#pragma mark -NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error.description);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString* newStr = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",newStr);
    [self.conn cancel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
