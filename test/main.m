//
//  main.m
//  test
//
//  Created by 임재욱 on 2021/12/22.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
