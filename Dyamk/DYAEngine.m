//
//  DYAEngine.m
//  DynamicKit
//
//  Created by soulghost on 22/6/2018.
//  Copyright © 2018 soulghost. All rights reserved.
//

#import "DYAEngine.h"
#import <dlfcn.h>
#import <CocoaAsyncSocket/GCDAsyncSocket.h>

@interface DYAEngine () <GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *server;
@property (nonatomic, assign) NSInteger currentDylibNo;

@end

@implementation DYAEngine

- (BOOL)startAtPort:(uint16_t)port error:(NSError *__autoreleasing *)error {
    if (self.server.isConnected) {
        [self.server disconnect];
    }
    GCDAsyncSocket *server = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(0, 0)];
    self.server = server;
    NSError *err = nil;
    [server acceptOnPort:port error:&err];
    if (err) {
        if (error != nil) {
            *error = err;
        }
        return NO;
    }
    return YES;
}

- (void)stop {
    [self.server disconnect];
    self.server = nil;
}

- (void)performDylib {
    NSString *libPath = @"/opt/Dyamk/dylib/DyamkInjector.framework";
    libPath = [libPath stringByAppendingPathComponent:[NSString stringWithFormat:@"DyamkInjector_%@", @(self.currentDylibNo)]];
    void *handle = dlopen(libPath.UTF8String, RTLD_NOW);
    if (!handle) {
        NSLog(@"Error: cannot find <%@>", libPath);
        return;
    }
    NSString *className = [NSString stringWithFormat:@"DyamkNativeInjector_%@", @(self.currentDylibNo)];
    Class class = NSClassFromString(className);
    if (class == nil) {
        NSLog(@"Error: cannot find class %@", className);
        dlclose(handle);
        return;
    }
    [class performSelector:@selector(run)];
    dlclose(handle);
}

#pragma mark - GCDAsyncSocket Delegate
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSString *dylibNoStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.currentDylibNo = [dylibNoStr intValue];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performDylib];
    });
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [newSocket readDataWithTimeout:-1 tag:0];
    });
}

@end
