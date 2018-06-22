//
//  DyamkCodePlayground.m
//  DyamkInjector
//
//  Created by soulghost on 22/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import <UIKit/UIKit.h>

void __dyamk_debug_code_goes_here() {
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    UIViewController *vc = window.rootViewController;
    vc.view.backgroundColor = [UIColor redColor];
}
