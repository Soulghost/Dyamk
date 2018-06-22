//
//  ViewController.m
//  DyamkDemoApp
//
//  Created by soulghost on 22/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import "ViewController.h"
#import "DYAEngine.h"

@interface ViewController ()

@property (nonatomic, strong) DYAEngine *dyaEngine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dyaEngine = [[DYAEngine alloc] init];
    NSError *dyaError = nil;
    [self.dyaEngine startAtPort:2224 error:&dyaError];
    if (dyaError) {
        NSLog(@"Error: %@", dyaError);
    } else {
        NSLog(@"DYA Server start at 2224");
    }
}

@end
