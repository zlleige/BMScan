//
//  BMZDYScanVC.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/5/16.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMZDYScanVC.h"

@interface BMZDYScanVC ()

@end

@implementation BMZDYScanVC

- (void)scanCaptureWithValueString:(NSString *)valueString {
    [super scanCaptureWithValueString:valueString];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startScanning];
    });
}

- (BMScanLin)scanLin {
    return self.scanLinType;
}

- (UIColor *)scanfLin {
    return self.linColor;
}

- (UIColor *)feetColor {
    return self.footColor;
}

@end
