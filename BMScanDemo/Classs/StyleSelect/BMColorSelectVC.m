//
//  BMColorSelectVC.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/5/16.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMColorSelectVC.h"
#import "HRColorPickerView.h"

@interface BMColorSelectVC ()

@property (weak, nonatomic) IBOutlet HRColorPickerView *colorPickerView;

@end

@implementation BMColorSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorPickerView.color = self.color;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:0 target:self action:@selector(okClick)];
}

- (void)okClick {
    if (self.colorSelectBlock) {
        self.colorSelectBlock(self.colorPickerView.color);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
