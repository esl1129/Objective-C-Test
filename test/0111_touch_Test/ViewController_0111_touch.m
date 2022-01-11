//
//  ViewController_0111_touch.m
//  test
//
//  Created by 임재욱 on 2022/01/11.
//

#import "ViewController_0111_touch.h"

@interface ViewController0111 ()

@end

@implementation ViewController0111
@synthesize webView;
- (void)viewDidLoad {
    [super viewDidLoad];
    x = 0.0;
    y = 0.0;
    if (@available(iOS 11, *)) {
        [webView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [webView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    } else {
        [webView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor].active = YES;
        [webView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor].active = YES;
    }
    [webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Began");
    UITouch *touch = [[touches allObjects] objectAtIndex: 0];
    CGPoint currentPoint = [touch locationInView: self.view];
    x = currentPoint.x;
    y = currentPoint.y;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"End");
    NSLog(@"Start : (x: %f, y: %f)",x,y);
    UITouch *touch = [[touches allObjects] objectAtIndex: 0];
    CGPoint currentPoint = [touch locationInView: self.view];
    x = currentPoint.x;
    y = currentPoint.y;
    NSLog(@"Start : (x: %f, y: %f)",x,y);
    return;
}

@end
