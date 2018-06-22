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
There are two project in the `Dyamk` dir, `DyamkInjector` and `DyamkDemoApp`, the former is the dylib generate and inject project and the latter is a demo app to be injected at runtime, when you use this framework for your own app, your app will be the latter one, now we just talk about the demo.
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
