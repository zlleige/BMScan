//
//  BMScanCodeManagerVC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/5/17.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMScanCodeManagerVC.h"
#import "UIImage+BMScan.h"

@interface BMScanCodeManagerVC ()

@property (weak, nonatomic) IBOutlet UILabel *qrCodeLabel; // 知道的二维码
@property (weak, nonatomic) IBOutlet UITextField *qrCodeFiled;
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation BMScanCodeManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.qrImageView.contentMode = UIViewContentModeScaleToFill;
}


- (IBAction)qrcode:(id)sender {
    self.qrImageView.image = [UIImage bm_imageWithQRCode:self.qrCodeFiled.text maxSize:CGSizeMake(100, 100)];
}
- (IBAction)barCode:(id)sender {
    self.qrImageView.image = [UIImage bm_imageWithBarCode:self.qrCodeFiled.text maxSize:CGSizeMake(100, 100)];
}

// 相册
- (IBAction)imageCodeButtonClick:(id)sender {
}

@end
