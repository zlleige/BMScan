//
//  BMZDYVC.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/5/16.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMZDYVC.h"
#import "BMColorSelectVC.h"
#import "BMZDYScanVC.h"

@interface BMZDYVC ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSelect;
@property (weak, nonatomic) IBOutlet UIButton *scanLinColor;
@property (weak, nonatomic) IBOutlet UIButton *scanFootColor;

@end

@implementation BMZDYVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:0 target:self action:@selector(okClick)];
}

- (void)okClick {
    BMZDYScanVC *VC = [BMZDYScanVC new];
    VC.scanLinType = self.typeSelect.selectedSegmentIndex;
    VC.footColor = self.scanFootColor.backgroundColor;
    VC.linColor = self.scanLinColor.backgroundColor;
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)typeSelectClick:(id)sender {
}

- (IBAction)scanLin:(id)sender {
    BMColorSelectVC *vc = [BMColorSelectVC new];
    vc.color = self.scanLinColor.backgroundColor;
    vc.colorSelectBlock = ^(UIColor *color){
        self.scanLinColor.backgroundColor = color;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)scanFoot:(id)sender {
    BMColorSelectVC *vc = [BMColorSelectVC new];
    vc.color = self.scanFootColor.backgroundColor;
    vc.colorSelectBlock = ^(UIColor *color){
        self.scanFootColor.backgroundColor = color;
    };
    [self.navigationController pushViewController:vc animated:YES];

}

@end
