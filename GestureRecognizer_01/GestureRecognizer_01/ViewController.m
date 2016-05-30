//
//  ViewController.m
//  GestureRecognizer_01
//
//  Created by SuperWang on 16/5/24.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGRect _rect;
}
@end
//手势
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //总共有7种手势
    //所有的手势的顶级父类
    //UIGestureRecognizer
    
    /*
     //1,tap 点击
     UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
     //需要的手指数量
     tapGesture.numberOfTouchesRequired = 1;
     //需要的点击次数
     tapGesture.numberOfTapsRequired = 2;
     //将手势添加到需要识别的视图上面
     [self.view addGestureRecognizer:tapGesture];
     */
    
    
    //2,pan 平移
    UIView *redView = [[UIView alloc]init];
    redView.frame = CGRectMake(0, 0, 180,180);
    redView.center = self.view.center;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
//    [redView addGestureRecognizer:panGesture];
    
    
    //3,swipe 轻扫
//    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction:)];
//    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionDown;
//    
//    [self.view addGestureRecognizer:swipeGesture];
    
    //4,pinch 捏合
//    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
//    [redView addGestureRecognizer:pinchGesture];
    
    
    //5,screenEdgePan 边缘划入
    UIScreenEdgePanGestureRecognizer *edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgeGestureAction)];
    edgeGesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgeGesture];
    
    
    //6,rotation 旋转
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationGestureAction:)];
    [redView addGestureRecognizer:rotationGesture];
    
    //7,longPress 长按
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureAction:)];
    [self.view addGestureRecognizer:longPressGesture];
    
}

-(void)longPressGestureAction:(UILongPressGestureRecognizer*)gesture
{
    //长按,和UIMenuController 弹出的copy 粘贴 进行组合使用
    UIMenuController *menuCtr = [UIMenuController sharedMenuController];
    
    UIMenuItem *item = [[UIMenuItem alloc]initWithTitle:@"自定义" action:@selector(action)];
    
    menuCtr.menuItems = @[item];
    
    //定位手势在view中的位置
    CGPoint point = [gesture locationInView:gesture.view];
    //设置显示的位置
    [menuCtr setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:gesture.view];
    //激活
    [menuCtr setMenuVisible:YES animated:YES];
}

-(void)action
{
    
}
//如果想让menuCtr弹出,需要实现以下几个方法
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)cut:(nullable id)sender
{
    
}
- (void)copy:(nullable id)sender
{
    
}
- (void)paste:(nullable id)sender
{
    
}


#pragma mark - rotation
-(void)rotationGestureAction:(UIRotationGestureRecognizer*)gesture
{
    gesture.view.transform = CGAffineTransformMakeRotation(gesture.rotation);
}


#pragma mark - edge
-(void)edgeGestureAction
{
    NSLog(@"edge!!!");
}
#pragma mark - Pinch
-(void)pinchAction:(UIPinchGestureRecognizer*)gesture
{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
         _rect = gesture.view.frame;
        
    } else
    
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        //frame写法
        //计算缩放的值
        CGFloat w = CGRectGetWidth(_rect)*(1-gesture.scale)/2;
        CGFloat h = CGRectGetHeight(_rect)*(1-gesture.scale)/2;
        
        //x = x + w
        //y = y + h
        //w = w +2*w
        //h = h +2*h
        gesture.view.frame = CGRectInset(_rect, w, h);
        
        //transform 写法
        //gesture.view.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
    }
}



#pragma mark - Tap
-(void)tapGestureAction:(UITapGestureRecognizer*)gesture
{
    NSLog(@"Tap !!!");
}

#pragma mark - Pan
-(void)panGestureAction:(UIPanGestureRecognizer*)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"Pan Start!");
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            //NSLog(@"Pan Changed!");
            CGPoint point = [gesture translationInView:gesture.view];
            
            gesture.view.frame = CGRectOffset(gesture.view.frame, point.x, point.y);
            
            //清空上次的偏移量,得到每次的偏移量
            [gesture setTranslation:CGPointZero inView:gesture.view];
            
            
            NSLog(@"%@",NSStringFromCGPoint(point));
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"Pan Ended");
            break;
        }
            
        default:
            break;
    }
}
#pragma mark - Swipe
-(void)swipeGestureAction:(UISwipeGestureRecognizer*)gesture
{
    NSLog(@"swipe !");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end








