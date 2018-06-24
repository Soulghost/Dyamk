//
//  DyamkUIAspectTool.h
//  DyamkInjector
//
//  Created by soulghost on 23/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import <UIKit/UIKit.h>

UIViewController* dya_getTopViewController(void);
UIViewController* dya_getViewControllerByClassName(NSString *className);
UIViewController* dya_presentControllerForDebug(void);
