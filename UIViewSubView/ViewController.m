//
//  ViewController.m
//  UIViewSubView
//
//  Created by trung bao on 04/11/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawSquares];
    [self performSelector:@selector(rotateimages)
               withObject:nil
               afterDelay:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) drawSquares {
    CGSize viewSize =self.view.bounds.size;
    CGFloat margin =20;
    CGFloat recWidth= viewSize.width-2*margin;
    CGPoint center= CGPointMake(viewSize.width/2, viewSize.height/2);
    for (int i=0; i<12; i++) {
        UIView * square;
        if (i%2==0) {
            square =[self drawSquaresByWidth:recWidth
                                      Rotate:false
                                      Center:center];
        }else {
            square = [self drawSquaresByWidth:recWidth
                                       Rotate:true
                                       Center:center];
        }
        [self.view addSubview:square];
        recWidth=recWidth*0.707;
    }
}
-(UIView *) drawSquaresByWidth: (CGFloat) width
                    Rotate: (BOOL) rotate
                    Center: (CGPoint) center
{
    UIView *square =[[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center =center;
    square.backgroundColor= rotate ? [UIColor redColor] : [UIColor blueColor];
    square.transform= rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}
-(void) rotateimages {
    [UIView animateWithDuration:1.0 animations:^{
    for (int i=0; i<self.view.subviews.count; i++) {
        if (i%2==0) {
            self.view.subviews[i].transform=CGAffineTransformMakeRotation(M_PI_4);
        }/*else {
            self.view.subviews[i].transform=CGAffineTransformIdentity;
        }*/
    }
    }];
}
@end
