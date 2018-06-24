//
//  DyamkEventTool.h
//  DyamkInjector
//
//  Created by soulghost on 24/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Dyamk_Runtime_Method_Params id self, SEL _cmd,

#define Dyamk_IMP(fname) (IMP)__dyamk_debug_symbol_##fname

#define Dyamk_AddMethod(class, sel, fname, encode) class_replaceMethod(NSClassFromString(@#class), sel, Dyamk_IMP(fname), #encode)

#define Dyamk_Method_1(ret, fname, type, name) ret __dyamk_debug_symbol_##fname (Dyamk_Runtime_Method_Params type name)
#define Dyamk_Method_2(ret, fname, t1, n1, t2, n2) ret __dyamk_debug_symbol_##fname (Dyamk_Runtime_Method_Params t1 n1, t2 n2)

