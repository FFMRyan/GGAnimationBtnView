//
//  ViewController.m
//  GGPOPAnimationView
//
//  Created by iOSGeekOfChina on 2016/11/30.
//  Copyright © 2016年 geek. All rights reserved.
//

#import "ViewController.h"
#import "GGAnimationShowBtnView.h"
@interface ViewController ()
@property (nonatomic,strong) GGAnimationShowBtnView * animationShowBtnView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.animationShowBtnView = [[GGAnimationShowBtnView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-35, self.view.frame.size.height/2-35, 70, 70)];
    [self.view addSubview:self.animationShowBtnView];
    
    UIButton * showBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/2+90, 60, 30)];
    [showBtn setTitle:@"" forState:UIControlStateNormal];
    [showBtn setTitle:@"" forState:UIControlStateSelected];
    [showBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [showBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    
}
- (void)showBtnClick{
    
    [self.animationShowBtnView centerImageViewClick];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
