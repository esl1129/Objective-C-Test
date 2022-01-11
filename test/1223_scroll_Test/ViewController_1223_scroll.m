////
////  ViewController.m
////  test
////
////  Created by 임재욱 on 2021/12/22.
////
//
//#import "ViewController_1223_scroll.h"
//
//@interface ViewController11 ()
//
//@end
//
//@implementation ViewController11
//@synthesize listBtn;
//@synthesize scnView;
//
//- (void)viewDidLoad
//{
//    // listBtn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
//    /// 2021.12.08
//    /*
//    scnView.frame = CGRectMake(self.view.frame.size.width-40, 120, 40, self.view.frame.size.height-200);
//    scnView.backgroundColor = UIColor.grayColor;
//    listBtn.frame = CGRectMake(0,0, 40, 30);
//    listBtn.backgroundColor = UIColor.blueColor;
//    [self.view addSubview:scnView];
//    [scnView addSubview:listBtn];
//
//    // [listBtn release];
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveScroll:)];
//    [panGestureRecognizer setMinimumNumberOfTouches:1];
//    [panGestureRecognizer setMaximumNumberOfTouches:1];
//    [scnView addGestureRecognizer:panGestureRecognizer];
//     */
//
//
//}
//
//-(void) moveScroll:(UIPanGestureRecognizer *)recognizer;
//{
//    CGPoint currentlocation = [recognizer locationInView: scnView];
//    int y = 15.0;
//    int p = (listBtn.center.y/(scnView.frame.size.height/20));
//    float max = self.view.frame.size.height-215;
//    if (currentlocation.y > y){
//        if (currentlocation.y > max) {
//            y = max;
//        } else {
//            y = currentlocation.y;
//
//        }
//    }
//    listBtn.center = CGPointMake(listBtn.center.x, y);
//    NSLog([NSString stringWithFormat:@"%d", p+1]);
//}
//
//
//@end
