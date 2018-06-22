# Dyamk
iOS native code injector at runtime, only for debug.

## Installation
- Clone the repo and go into it.
```bash
git clone https://github.com/Soulghost/Dyamk
cd Dyamk
```

- Run `install.sh`, it needs root to mkdir in /opt, you can check if it is safe by your self.
```bash
sh install.sh
```

## How to get start
There are two project in the `Dyamk` folder, `DyamkInjector` and `DyamkDemoApp`, the former is the dylib generate and inject project and the latter is a demo app to be injected at runtime, when you use this framework for your own app, your app will be the latter one, now we just talk about the demo.

## Demo App
- go into the `DyamkDemoApp` folder, open it with Xcode, if the pod library not installed, just run `pod install` at the project root.
- run it with a iOS Simulator, the framework does not support real device by default.
- because the Dyamk library needs socket to receive build message from injector, there will be an alert to confirm.
- if there is no error, you can see logs in console as below.
```plain
2018-06-22 21:01:03.051985+0800 DyamkDemoApp[52912:50098406] DYA Server start at 2224
```
- now the demo app is ready to inject code, now you can leave the project but keep the app running on Simulator.

## DyamkInjector Project
- go into the `DyamkInjector` dir and open the project with Xcode.
- change the build Target to `BuildMe`
- open `DyamkCodePlayground.m`, you can see the function `__dyamk_debug_code_goes_here`, your code to inject goes here.
```objc
void __dyamk_debug_code_goes_here() {
    // a simple code to inject
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    UIViewController *vc = window.rootViewController;
    vc.view.backgroundColor = [UIColor redColor];
}
```
- build the project, and you can see the demo app running on Simulator has changed it view's background color to red.
- you can write some code in the `__dyamk_debug_code_goes_here` function, when you build it, these code will be injected to demo app.
