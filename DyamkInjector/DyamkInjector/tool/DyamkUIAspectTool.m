//
//  DyamkUIAspectTool.m
//  DyamkInjector
//
//  Created by soulghost on 23/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import "DyamkUIAspectTool.h"

UIViewController *__vc_being_presented;

NSArray<UIViewController *> * __dya_getViewControllers(void) {
    NSArray *wds = [UIApplication sharedApplication].windows;
    NSMutableArray *vcs = @[].mutableCopy;
    for (UIWindow *wd in wds) {
        UIViewController *root = wd.rootViewController;
        [vcs addObject:root];
        if ([root isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)root;
            [vcs addObjectsFromArray:nav.viewControllers];
        } else if ([root isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)root;
            [vcs addObjectsFromArray:tab.viewControllers];
        }
    }
    return vcs.copy;
}

UIViewController* __dya_topViewControllerWithRootViewController(UIViewController* rootViewController) {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return __dya_topViewControllerWithRootViewController(tabBarController.selectedViewController);
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return __dya_topViewControllerWithRootViewController(navigationController.visibleViewController);
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return __dya_topViewControllerWithRootViewController(presentedViewController);
    } else {
        return rootViewController;
    }
}

UIViewController* dya_getTopViewController(void) {
    return __dya_topViewControllerWithRootViewController([UIApplication sharedApplication].keyWindow.rootViewController);
}

UIViewController* dya_getViewControllerByClassName(NSString *className) {
    NSArray *allVcs = __dya_getViewControllers();
    for (UIViewController *vc in allVcs) {
        if ([vc isMemberOfClass:NSClassFromString(className)]) {
            return vc;
        }
    }
    return nil;
}

UIViewController* dya_presentControllerForDebug(void) {
    if (__vc_being_presented) {
        [__vc_being_presented dismissViewControllerAnimated:NO completion:nil];
    }
    __vc_being_presented = [UIViewController new];
    [dya_getTopViewController() presentViewController:__vc_being_presented animated:YES completion:nil];
    __vc_being_presented.view.backgroundColor = [UIColor whiteColor];
    return __vc_being_presented;
}


