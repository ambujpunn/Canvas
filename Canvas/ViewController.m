//
//  ViewController.m
//  Canvas
//
//  Created by Ambuj Punn on 9/17/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *gestureRecognizer;
@property (weak, nonatomic) IBOutlet UIView *tray;
@property CGPoint trayOriginalCenter;
@property CGPoint velocity;
@property CGPoint positionUp;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property CGPoint positionDown;
@property (strong, nonatomic) UIImageView *newlyCreatedFace;
@end

@implementation ViewController
- (IBAction)smileysGesture:(UIPanGestureRecognizer *)sender {
    CGPoint smileyOriginalCenter = [sender locationInView:self.view];
   
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIImageView *image = (UIImageView *)sender.view;
        self.newlyCreatedFace = [[UIImageView alloc] initWithImage:image.image];
        [self.view addSubview:self.newlyCreatedFace];
        //self.newlyCreatedFace.center = CGPointMake(image.center.x, image.center.y + self.tray.frame.origin.y);
        self.newlyCreatedFace.center = smileyOriginalCenter;
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        //self.newlyCreatedFace.center = CGPointMake(smileyOriginalCenter.x + [sender translationInView:sender.view].x, smileyOriginalCenter.y + [sender translationInView:sender.view].y);
        self.newlyCreatedFace.center = smileyOriginalCenter;
    }
}

- (IBAction)onCustomTap:(UIPanGestureRecognizer *)sender {
    self.velocity = [sender velocityInView:self.tray];
    
    if (self.velocity.y > 0) {
        //self.trayOriginalCenter = self.positionUp;
        self.tray.center = self.positionDown;
    } else if (self.velocity.y < 0) {
        self.tray.center = self.positionUp;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tray addGestureRecognizer:self.gestureRecognizer];
    self.trayOriginalCenter = self.tray.center;
    self.positionDown = self.tray.center;
    self.positionUp = CGPointMake(self.tray.bounds.size.width/2.0, self.trayOriginalCenter.y - self.tray.bounds.size.height + (self.view.frame.size.height - self.tray.frame.origin.y));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
