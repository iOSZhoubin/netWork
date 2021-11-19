//
//  ViewController.m
//  XFPingTester
//
//  Created by lingxuanfeng on 2018/12/20.
//  Copyright © 2018 lingxuanfeng. All rights reserved.
//

#import "ViewController.h"

#import "XFPingTester.h"

@interface ViewController () <XFPingDelegate>

@property (strong,nonatomic) XFPingTester *pingTester1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.pingTester1 = [[XFPingTester alloc] initWithHostName:@"14.215.177.39"];
    self.pingTester1.delegate = self;
    [self.pingTester1 startPing];
}

#pragma mark - XFPingDelegate
- (void)didPingSucccessWithHostName:(NSString *)hostName withTime:(float)time withError:(NSError *)error;
{
    if (error)
    {
        NSLog(@"网络有问题");
    }
    else
    {
        NSLog(@"hostName：%@, %@", hostName, [[NSString stringWithFormat:@"%d", (int)time] stringByAppendingString:@"ms"]);
        
        [self.pingTester1 stopPing];
    }
}

@end
