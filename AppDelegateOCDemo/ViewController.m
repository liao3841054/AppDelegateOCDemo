//
//  ViewController.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *rootLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    rootLabel.textAlignment = NSTextAlignmentCenter;
    rootLabel.text = @"RootLabel";
    rootLabel.font = [UIFont boldSystemFontOfSize:23];
    [self.view addSubview:rootLabel];
}


@end
