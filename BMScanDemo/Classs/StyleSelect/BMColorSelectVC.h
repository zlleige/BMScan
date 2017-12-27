//
//  BMColorSelectVC.h
//  BMScanDemo
//
//  Created by __liangdahong on 2017/5/16.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BMColorSelectBlock)(UIColor *color);

@interface BMColorSelectVC : UIViewController

@property (strong, nonatomic) UIColor *color;

@property (copy, nonatomic) BMColorSelectBlock colorSelectBlock;

@end
