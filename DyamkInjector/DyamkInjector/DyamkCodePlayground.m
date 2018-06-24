//
//  DyamkCodePlayground.m
//  DyamkInjector
//
//  Created by soulghost on 22/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DyamkUIAspectTool.h"
#import <objc/runtime.h>
#import "DyamkEventTool.h"

Dyamk_Method_1(void, onClick, id, sender) {
    NSLog(@"sender iss %@", sender);
    UIViewController *vc = (UIViewController *)self;
    UIView *v = [vc.view viewWithTag:1];
    v.frame = CGRectMake(100, 100, arc4random_uniform(100) + 100, arc4random_uniform(100) + 100);
}

Dyamk_Method_2(int, add, int, a, int, b) {
    return a+b;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

@interface UIViewController (Ext)

- (int)add:(int)a andB:(int)b;

@end

void __dyamk_debug_code_goes_here() {
//    UIViewController *vc = dya_getViewControllerByClassName(@"ViewController");
//    vc.view.backgroundColor = [UIColor lightGrayColor];
    UIViewController *self = dya_presentControllerForDebug();
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *box = [UIView new];
    box.tag = 1;
    box.frame = CGRectMake(100, 100, 200, 200);
    box.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:box];
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.center = self.view.center;
    [addBtn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    Dyamk_AddMethod(UIViewController, @selector(addClick:), onClick, v@:@);
    Dyamk_AddMethod(UIViewController, @selector(add:andB:), add, v@:ii);
    int res = [self add:1 andB:2];
    NSLog(@"add res is %d", res);
    [self.view addSubview:addBtn];
}

#pragma clang diagnostic pop


