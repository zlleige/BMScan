//
//  BMScanStyle1VC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMScanStyle1VC.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <BlocksKit/BlocksKit+UIKit.h>

@implementation BMScanStyle1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"相册" style:0 handler:^(id sender) {
        [NSObject bm_identifyPhotoAlbumQRCodeWithResultsBlock:^(NSArray<NSString *> *codeArray) {
            [SVProgressHUD showSuccessWithStatus:codeArray.description];
        }];
    }];
}

- (void)scanCaptureWithValueString:(NSString *)valueString {
    [super scanCaptureWithValueString:valueString];
    [SVProgressHUD showSuccessWithStatus:valueString];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startScanning];
    });
}

- (CGFloat)areaXHeight {
    return 300;
}

    
- (CGFloat)areaWidth {
    return 300;
}

@end
