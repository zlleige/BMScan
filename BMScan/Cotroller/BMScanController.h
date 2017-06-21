//
//  BMScanController.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 扫描控制器的基类
 */
@interface BMScanController : UIViewController

#pragma mark - 扫描响应

/**
 开始扫描
 */
- (void)startScanning NS_REQUIRES_SUPER;

/**
 结束扫描
 */
- (void)closureScanning NS_REQUIRES_SUPER;

/**
 扫描到内容时回调
 */
- (void)scanCaptureWithValueString:(NSString *)valueString NS_REQUIRES_SUPER;

#pragma mark - 配置信息

/**
 设置可以识别区域
 */
- (CGRect)rectOfInterest;

#pragma mark - 操作

/**
 刷新扫描
 */
- (void)reloadScan NS_REQUIRES_SUPER;

@end
