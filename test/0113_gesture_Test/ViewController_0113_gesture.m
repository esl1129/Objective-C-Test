//
//  ViewController_0113_gesture.m
//  test
//
//  Created by 임재욱 on 2022/01/13.
//

#import "ViewController_0113_gesture.h"

@interface ViewController_0113_gesture ()

@end

@implementation ViewController_0113_gesture

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark Gesture Recognizers
- (void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    float newScaleWidth = self.imageView.scrollView.subviews[0].frame.size.width/self.imageView.scrollView.frame.size.width;
    float newScaleHeight = self.imageView.scrollView.subviews[0].frame.size.height/self.imageView.scrollView.frame.size.height;
    if (newScaleWidth < 1.1 || newScaleHeight < 1.1) {
        scrollView.zoomScale = 1.0;
        scrollView.subviews[0].frame = scrollView.frame;
        gestureView.hidden = NO;
    }
}

- (void) initView
{
    // webView(imageView) & scrollView
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView = imageView.scrollView;
    scrollView.delegate = self;
    if (@available(iOS 11, *)) {
        [scrollView setContentInsetAdjustmentBehavior: UIScrollViewContentInsetAdjustmentAlways];
        [imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [imageView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
        [imageView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
        [imageView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
        
    } else {
        [imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        [imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    }
    
    
    // listView & listBtn (SideScrollView)
    listView.frame = CGRectMake(self.view.frame.size.width-50, 0, 50, self.view.frame.size.height-85);
    listView.backgroundColor = UIColor.grayColor;
    listView.translatesAutoresizingMaskIntoConstraints = NO;
    
    listBtn.frame = CGRectMake(0,0, 50, 50);
    listBtn.backgroundColor = UIColor.blackColor;
    [listView addSubview:listBtn];
    
    // Gesture View
    gestureView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-50, [[UIScreen mainScreen] bounds].size.height);
    gestureView.translatesAutoresizingMaskIntoConstraints = NO;
    gestureView.hidden = NO;
}
- (void) initGestures
{
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    UISwipeGestureRecognizer *upSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    UISwipeGestureRecognizer *downSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchWebView:)];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveScroll:)];
    
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    upSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    downSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    
    [gestureView addGestureRecognizer:singleTapGestureRecognizer];
    [scrollView.subviews[0] addGestureRecognizer:doubleTapGestureRecognizer];
    [gestureView addGestureRecognizer:leftSwipeGestureRecognizer];
    [gestureView addGestureRecognizer:rightSwipeGestureRecognizer];
    [gestureView addGestureRecognizer:upSwipeGestureRecognizer];
    [gestureView addGestureRecognizer:downSwipeGestureRecognizer];
    [gestureView addGestureRecognizer:pinchGestureRecognizer];
    [panGestureRecognizer setMinimumNumberOfTouches:1];
    [panGestureRecognizer setMaximumNumberOfTouches:1];
    [listView addGestureRecognizer:panGestureRecognizer];
    
    
    // MRC
    [singleTapGestureRecognizer release];
    [doubleTapGestureRecognizer release];
    [leftSwipeGestureRecognizer release];
    [rightSwipeGestureRecognizer release];
    [upSwipeGestureRecognizer release];
    [downSwipeGestureRecognizer release];
    [panGestureRecognizer release];
    [pinchGestureRecognizer release];
}

- (void) handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    [self hideTitleBar];
    [self showToast];
}
- (void) handleDoubleTap:(UITapGestureRecognizer *)recognizer
{
    scrollView.zoomScale = 1.0;
    gestureView.hidden = NO;
    scrollView.subviews[0].frame = scrollView.frame;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self showToast];
}

- (void) handleSwipes:(UISwipeGestureRecognizer*)recognizer
{
    // 이미지 존재 X -> 실행 X
    if ([imageListURL count] <= 0) {
        return;
    }
    if ([direction isEqualToString:@"vertical"]) {
        if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
            currentPage++;
        } else {
            currentPage--;
        }
    } else {
        if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
            currentPage++;
        } else {
            currentPage--;
        }
    }
    // currentPage가 전체 페이지보다 커지지 않게
    currentPage = currentPage > totalCount ? totalCount : currentPage;
    // currentPage가 1페이지 보다 작아지지 않게
    currentPage = currentPage < 1 ? 1 : currentPage;
    [self showToast];
    listBtn.center = CGPointMake(listBtn.center.x, (listView.frame.size.height/listView.tag)*(currentPage-1)+listBtn.frame.size.height/2);
    [self getImageWithRequest];
}

-(void) moveScroll:(UIPanGestureRecognizer *)recognizer;
{
    // 이미지 요청
    // 통신 태우기 전에 이미지 존재 여부 체크
    if ([imageListURL count] <= 0) {
        return;
    }
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.view.userInteractionEnabled = NO;
    }
    CGPoint currentlocation = [recognizer locationInView: listView];
    float minY = listView.frame.origin.y+listBtn.frame.size.height/2;
    float maxY = listView.frame.origin.y+listView.frame.size.height-listBtn.frame.size.height/2;
    int currentPositionY = minY;
    int newPage = (listBtn.center.y/(listView.frame.size.height/listView.tag));
    if (currentlocation.y > currentPositionY){
        if (currentlocation.y > maxY) {
            currentPositionY = maxY;
        } else if (currentlocation.y < minY) {
            currentPositionY = minY;
        } else {
            currentPositionY = currentlocation.y;
        }
    }
    listBtn.center = CGPointMake(listBtn.center.x, currentPositionY);
    currentPage = newPage+1;
    if (currentPage <= 0 || currentPage > [imageListURL count]) {
        return;
    }
    [self showToast];
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        self.view.userInteractionEnabled = YES;
        listBtn.center = CGPointMake(listBtn.center.x, (listView.frame.size.height/listView.tag)*newPage+listBtn.frame.size.height/2);
        [self getImageWithRequest];
    }
    return;
}



- (void) pinchWebView:(UIPinchGestureRecognizer *)recognizer;
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (scrollView.zoomScale <= 1.0) {
            scrollView.zoomScale = 1.0;
        } else {
            gestureView.hidden = YES;
        }
    }
    if (gestureView.hidden == NO) {
        scrollView.zoomScale = recognizer.scale;
    }
    return;
}

@end
