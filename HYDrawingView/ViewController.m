//
//  ViewController.m
//  HYDrawingView
//
//  Created by XZM_XHY on 15/6/26.
//  Copyright (c) 2015年 HY. All rights reserved.
//

#import "ViewController.h"
#import "HYDrawView.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet HYDrawView *drawView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clear:(id)sender
{
    [self.drawView clear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
