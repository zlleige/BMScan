//
//  BMStyleSelectVC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMStyleSelectVC.h"
#import "BMScanStyle1VC.h"
#import "BMScanStyle2VC.h"
#import "BMScanDefaultCotroller.h"

@interface BMStyleSelectVC ()

@end

@implementation BMStyleSelectVC

- (IBAction)button1Click {
    [self.navigationController pushViewController:[BMScanStyle1VC new] animated:YES];
}

- (IBAction)button2Click {
    [self pushWithScanLinAnimation:BMScanLinTypeLin];
}

- (IBAction)button3Click {
    [self pushWithScanLinAnimation:BMScanLinTypeReticular1];
}

- (IBAction)button4Click {
    [self pushWithScanLinAnimation:BMScanLinTypeReticular2];
}

- (void)pushWithScanLinAnimation:(BMScanLin)scanLin {
    BMScanStyle2VC *scanStyle2VC = [BMScanStyle2VC new];
    scanStyle2VC.scanLin = scanLin;
    [self.navigationController pushViewController:scanStyle2VC animated:YES];
}

@end
