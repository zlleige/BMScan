//
//  BMScanStyle2VC.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/4/30.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMScanStyle2VC.h"
#define kw  [[UIScreen mainScreen] bounds].size.width
#define kh  [[UIScreen mainScreen] bounds].size.height

@implementation BMScanStyle2VC

- (void)scanCaptureWithValueString:(NSString *)valueString {
    [super scanCaptureWithValueString:valueString];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startScanning];
    });
}

- (CGFloat)areaX {
    return (kw  - 200)/2.0;
}

- (CGFloat)areaY {
    return 100;
}

- (CGFloat)areaWidth {
    
    return 200;
}

- (CGFloat)areaXHeight {
    
    return 200;
}
- (CGFloat)areaTitleDistanceHeight {
    return 10;
}

- (UIColor *)areaColor {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:arc4random_uniform(100)/100.0];
}

- (UIColor *)feetColor {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

- (UIColor *)scanfLin {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

- (BMScanLinViewAnimation)scanLinViewAnimation {
    return arc4random_uniform(4);
}

- (BMScanLin)scanLin {
    return self.scanLinType;
}

@end
