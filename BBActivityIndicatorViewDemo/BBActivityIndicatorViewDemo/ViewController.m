//
//  ViewController.m
//  BBActivityIndicatorViewDemo
//
//  Created by zhiwei on 16/9/4.
//  Copyright © 2016年 zhiwei. All rights reserved.
//

#import "ViewController.h"
#import "BBActivityIndicatorView.h"

@interface ViewController ()

@property (nonatomic,strong) BBActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activity = [BBActivityIndicatorView defaultIndicator];
    self.activity.center = self.followBtn.center;
    self.activity.hidesWhenStopped = YES;
    [self.view addSubview:self.activity];
    
}



- (IBAction)follow:(UIButton *)sender {
    
    
    
    if (!sender.hidden) {
        sender.hidden = YES;
        [self.activity startAnimating];
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.activity stopAnimating];
        sender.hidden = NO;
        sender.selected = !sender.selected;
    });
    
    
    
    
    
}




@end
