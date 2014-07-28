//
//  GRViewController.m
//  _21_AnimationsTest
//
//  Created by Exo-terminal on 4/13/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()
//@property (weak, nonatomic) UIView* testView;

@property (weak, nonatomic) UIImageView* testImageView;

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* view = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor clearColor];
    UIImage* image1 = [UIImage imageNamed:@"1.png"];
    UIImage* image2 = [UIImage imageNamed:@"2.png"];
    UIImage* image3 = [UIImage imageNamed:@"3.png"];
    
    NSArray* images = [NSArray arrayWithObjects:image1, image2,image3, nil];
    view.animationImages = images;
    view.animationDuration = 1.f;
    
    [self.view addSubview:view];
//    [view startAnimating];
    
    self.testImageView = view;
 
}
-(UIColor*) randomColor{
    
    CGFloat r = (CGFloat)(arc4random() %256)/255;
    CGFloat g = (CGFloat)(arc4random() %256)/255;
    CGFloat b = (CGFloat)(arc4random() %256)/255;
    NSLog(@"%f, %f, %f",r,g,b);
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

-(void) moveView: (UIView*) view{
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    CGFloat x =arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y =arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat s = (float)(arc4random() % 151)/100.f + 0.5f;
    
    CGFloat r =(double)(arc4random() % (int)(M_PI * 2* 10000)) / 10000 - M_PI;
    CGFloat d = (float)(arc4random() % (int)(20001)) / 10000 + 2;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         view.center = CGPointMake(x,y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotating = CGAffineTransformMakeRotation(r);
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotating);
                         view.transform = transform;
                         
                         /*
                          self.testView.transform = CGAffineTransformMakeRotation(M_PI);
                          self.testView.transform = CGAffineTransformMakeTranslation(200, 420);
                          self.testView.transform = CGAffineTransformMakeScale(2, 0.5);*/
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Animation is finished %d", finished);
                         NSLog(@"\nView frame -%@\n View bounds -%@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* v = view;
                         [self moveView:v];
                     }];

    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self moveView:self.testImageView];
    
 /*   [UIView animateWithDuration:2
                     animations:^{
                        self.testView.center = CGPointMake((CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView.frame)/2), 150);
                     }];
    
    
    double delayInSecond = 6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSecond * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.testView.layer removeAllAnimations];
        
        [UIView animateWithDuration:4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState    | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                         animations:^{
                             self.testView.center = CGPointMake(500,500);
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"Animation is finished %d", finished);
                         }];
    });*/
 
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
