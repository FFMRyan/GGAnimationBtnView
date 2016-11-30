//
//  GGAnimationShowBtnView.m
//  Cece
//
//  Created by iOSGeekOfChina on 2016/11/30.
//
//

#import "GGAnimationShowBtnView.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGB2(rgbValue,alphatap) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphatap]

#define kAnimationDuration 0.4
#define kAnimationDelay 0.1
@interface GGAnimationShowBtnView (){
    BOOL isShow;
}
@property (nonatomic,strong) NSMutableArray * btnArray;


@end


@implementation GGAnimationShowBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        [self createBaseUIWithFrame:frame];
    }
    return self;
}
- (void)createBaseUIWithFrame:(CGRect)frame{
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = UIColorFromRGB2(0x000000, 0.5);
    
    self.centerImageView = [[UIImageView alloc]initWithFrame:frame];
    self.centerImageView.backgroundColor = UIColorFromRGB(0x3dd1e0);
    self.centerImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapCenterImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(centerImageViewClick)];
    [self.centerImageView addGestureRecognizer:tapCenterImage];
    
    _btnArray = [[NSMutableArray alloc]init];
    self.countTotal = 5;
    CGFloat angle = 180/(self.countTotal+1);
    CGFloat length = 90;
    for (int count = 0 ; count < self.countTotal; count++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        [btn setBackgroundColor:UIColorFromRGB(0x3dd1e0)];
        [btn setTitle:[NSString stringWithFormat:@"%d",count] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(tempBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn.tag = count;
        [_btnArray addObject:btn];
        CGFloat x2 = length*cosf(angle*(count+1)*M_PI/180);
        CGFloat y2 = length*sinf(angle*(count+1)*M_PI/180);
        CGPoint point = CGPointMake(self.centerImageView.center.x+x2, self.centerImageView.center.y-y2);
        
        btn.center = point;
    }
    isShow = NO;
    [self addSubview:self.centerImageView];
    [self hiddenAnimationBtn];
    
}
- (void)centerImageViewClick{
    isShow = !isShow;
    if (isShow) {
        self.centerImageView.transform = CGAffineTransformMakeRotation(45*M_PI/180);
        [self showAnimationBtn];
    }else{
        self.centerImageView.transform = CGAffineTransformMakeRotation(M_PI/180);
        [self hiddenAnimationBtn];
    }
    
    
}

//显示按钮
- (void)showAnimationBtn{
    
    for (int count = 0; count< _btnArray.count; count++) {
        UIButton *btn = _btnArray[count];
        btn.hidden = NO;
        CGFloat angle = 180/(self.countTotal+1);
        CGFloat length = 90;
        CGFloat x2 = length*cosf(angle*(count+1)*M_PI/180);
        CGFloat y2 = length*sinf(angle*(count+1)*M_PI/180);
        CGPoint point = CGPointMake(self.centerImageView.center.x-x2, self.centerImageView.center.y-y2);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimationDelay*count * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                btn.center = point;
            } completion:^(BOOL finished) {
                
            }];
            
            
        });
    }
    
    
}

//隐藏按钮
- (void)hiddenAnimationBtn{
    for (int count = 0; count< _btnArray.count; count++) {
        UIButton *btn = _btnArray[count];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimationDelay*count * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                btn.center = CGPointMake(self.centerImageView.center.x, self.centerImageView.center.y);
            } completion:^(BOOL finished) {
                btn.hidden = YES;
                
            }];
            
        });
    }
}

- (void)tempBtnClick:(id)sender{
    
    UIButton * btn = (UIButton *)sender;
    NSLog(@"点击了第%d",btn.tag);
    
    
    
    
    
}
@end
