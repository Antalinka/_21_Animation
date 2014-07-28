//
//  GRViewController.m
//  _21_Animation
//
//  Created by Exo-terminal on 4/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
//    int b =0;
     int i =0;
    
    for (UIView *view in self.views) {
        
        NSInteger x = (CGRectGetMaxX(self.view.frame) - 100);
        NSInteger y = (CGRectGetMaxY(self.view.frame) - 100);
        
        switch (i) {
            case 0:     [self createViewWithX:0 andY:0 andView:view];
                break;
            case 1:     [self createViewWithX:y andY:0 andView:view];
                break;
            case 2:     [self createViewWithX:0 andY:x andView:view];
                break;
            case 3:     [self createViewWithX:y andY:x andView:view];
                break;
                
            default:
                break;
        }
         view.backgroundColor = [self colorByIndex:i];
        i++;
    }
    
    
    
    
       /*NSInteger x = CGRectGetMaxY(self.view.bounds) - 100;
    NSInteger y = CGRectGetMaxX(self.view.bounds) - 100;
    
    UIView* view1 = [self createViewWithX:0 andY:0];
    UIView* view2 = [self createViewWithX:x andY:0];
    UIView* view3 = [self createViewWithX:x andY:y];
    UIView* view4 = [self createViewWithX:0 andY:y];
    
    view1.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    view3.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    view4.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];*/

   /*
    self.view1.backgroundColor = [self randomColor];
    self.view2.backgroundColor = [self randomColor];
    self.view3.backgroundColor = [self randomColor];
    self.view4.backgroundColor = [self randomColor];*/
    
//    [self callView];

}
/*
-(void) callView{
    int i = 1;
    BOOL rotate = arc4random()%2;
    
    for (UIView * view in [self.view subviews]) {
        
        if (i > 4) i = 1;
        
        if (view.tag == 1 && rotate) {

//            [self moveView:view andViewAnimationOptions: i << 16];
            i++ ;
        }
    }
}*/
-(UIColor*) colorByIndex: (int) i{
    UIColor* color = [UIColor redColor];
    switch (i) {
        case 0:        color = [UIColor redColor];
            break;
            
        case 1:        color = [UIColor orangeColor];
            break;
            
        case 2:        color = [UIColor yellowColor];
            break;
            
        case 3:        color = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    return color;
}
/*-(void) callView{
    
    BOOL rotate = arc4random() % 2;
    
    UIView* firstView = [self.views firstObject];
    int firstX = CGRectGetMinX(firstView.frame);
    int firstY = CGRectGetMinY(firstView.frame);
    CGRect firstRect = CGRectMake(firstX, firstY, 100, 100);
    
    UIView* lastView = [self.views lastObject];
    int lastX = CGRectGetMinX(lastView.frame);
    int lastY = CGRectGetMinY(lastView.frame);
    CGRect lastRect = CGRectMake(lastX, lastY, 100, 100);
    
    if (!rotate) {
        for (int i = ([self.views count]-1); i < [self.views count] ; i--) {
            
            UIView* view = [self.views objectAtIndex:i];
            UIView* view2 = [[UIView alloc]initWithFrame:lastRect];
            
            if (!(i == 0)){
                view2 = [self.views objectAtIndex:i-1];
            }
            
            NSLog(@"view - %@, view2 - %@", NSStringFromCGRect(view.frame),NSStringFromCGRect(view2.frame));
            
            [self moveView:view andViewAnimationOptions:view2];

    }
    }else{
        for (int i = 0; i < [self.views count] ; i++) {
            
            UIView* view = [self.views objectAtIndex:i];
            UIView* view2 = [[UIView alloc]initWithFrame:firstRect];
            
            if (!(i == ([self.views count]-1))){
                view2 = [self.views objectAtIndex:i+1];
            }
            
            [self moveView:view andViewAnimationOptions:view2];

        }

    }
}*/

/*
-(void) callView{
    int i = 1;
    for (UIView * view in [self.view subviews]) {
        if (i > 4) i = 1;
        if (view.tag == 1) {
           
            [self moveView:view andViewAnimationOptions: i << 16];
            i++ ;
            }
        }
}*/

-(void) callView{
    
    UIView* firstView = [self.views firstObject];
    int firstX = CGRectGetMinX(firstView.frame);
    int firstY = CGRectGetMinY(firstView.frame);
    CGRect firstRect = CGRectMake(firstX, firstY, 100, 100);
   
    for (int i = 0; i < [self.views count] ; i++) {
        int a = i + 1;
        
        UIView* view = [self.views objectAtIndex:i];
        CGRect rect = firstRect;
        
        UIView* view2 = [[UIView alloc]initWithFrame:firstRect];
        
        if (!(i == ([self.views count]-1))){
            UIView* view2 = [self.views objectAtIndex:i + 1];
            rect = view2.frame;
        }
        
        NSLog(@"view - %@, view2 - %@, %d", NSStringFromCGRect(view.frame),NSStringFromCGRect(view2.frame),a);

//       [self moveView:view andViewAnimationOptions:rect andInt:a];
        
//        NSLog(@"view - %@, view2 - %@", NSStringFromCGRect(view.frame),NSStringFromCGRect(view2.frame));

    }

}


-(void) moveView: (UIView*) view andViewAnimationOptions: (CGRect) rectView andInt: (int) i{
    
    UIView* view2 = [[UIView alloc]initWithFrame:rectView];
    view2.backgroundColor = [self colorByIndex:i];

//    CGRect rect = self.view.bounds;
//    rect = CGRectInset(rect, CGRectGetWidth(view.frame)/2, CGRectGetHeight(view.frame)/2);
    
    [UIView animateWithDuration:2
                          delay:0
                        options: UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat
                     animations:^{
                         view.center = view2.center;
                         view.backgroundColor = view2.backgroundColor;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Finished %d",finished);
                     }];
}

/*-(UIView*) createViewWithX:(NSInteger) x andY: (NSInteger) y{

        UIView* view = [[UIView alloc]initWithFrame:CGRectMake(x, y, 100, 100)];
        view.backgroundColor = [self randomColor];
        view.tag = 1;
    
    return view;
}
*/
-(void) createViewWithX:(NSInteger) x andY: (NSInteger) y andView: (UIView*) view{
    
    UIView* view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, 100, 100)];
    view.center = view1.center;
    
}

-(UIColor*) randomColor{
    CGFloat r = (CGFloat)(arc4random() %256)/255;
    CGFloat g = (CGFloat)(arc4random() %256)/255;
    CGFloat b = (CGFloat)(arc4random() %256)/255;

    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
