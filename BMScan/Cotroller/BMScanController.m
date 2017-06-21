//
//  BMScanController.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMScanController.h"
#import <AVFoundation/AVFoundation.h>

#pragma mark - 私有C函数

CGRect screenBounds() {
    UIScreen *screen = [UIScreen mainScreen];
    if (![screen respondsToSelector:@selector(fixedCoordinateSpace)]
        && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGRectMake(0, 0, CGRectGetHeight(screen.bounds), CGRectGetWidth(screen.bounds));
    }
    return screen.bounds;
}

AVCaptureVideoOrientation videoOrientationFromCurrentDeviceOrientation() {
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortrait:
            return AVCaptureVideoOrientationPortrait;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            return AVCaptureVideoOrientationLandscapeLeft;
            break;
        case UIInterfaceOrientationLandscapeRight:
            return AVCaptureVideoOrientationLandscapeRight;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            return AVCaptureVideoOrientationPortraitUpsideDown;
            break;
        default:
            return AVCaptureVideoOrientationPortrait;
            break;
    }
}

@interface BMScanController () <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureSession           *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) AVCaptureMetadataOutput    *output;

@end

@implementation BMScanController

#pragma mark -

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self closureScanning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
        || authStatus == AVAuthorizationStatusRestricted
        || authStatus == AVAuthorizationStatusDenied) {
        NSLog(@"没有相机 或者 没有相机权限");
        return ;
    }
    [self creatScanning];
}

#pragma mark - getters setters

- (AVCaptureMetadataOutput *)output {
    if (!_output) {
        _output = [[AVCaptureMetadataOutput alloc] init];
        // 设置代理 在主线程里刷新
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        __weak typeof(self) wself = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:AVCaptureInputPortFormatDescriptionDidChangeNotification
                                                          object:nil
                                                           queue:[NSOperationQueue mainQueue]
                                                      usingBlock: ^(NSNotification *_Nonnull note) {
                                                          __strong typeof(wself) self = wself;
                                                          self.output.rectOfInterest = [self.previewLayer metadataOutputRectOfInterestForRect:[self rectOfInterest]];
                                                      }];
    }
    return _output;
}

- (AVCaptureSession *)session {
    if (!_session) {
        _session = [AVCaptureSession new];
    }
    return _session;
}

- (AVCaptureVideoPreviewLayer *)previewLayer {
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResize;
        // 必须添加
        _previewLayer.frame = screenBounds();
        _previewLayer.connection.videoOrientation = videoOrientationFromCurrentDeviceOrientation();
    }
    return _previewLayer;
}

#pragma mark - 系统delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count) {
        // 停止扫描
        if (metadataObjects.count) {
            [self closureScanning];
            AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects[0];
            [self scanCaptureWithValueString:metadataObject.stringValue];
        }
    }
}

#pragma mark - 公有方法

- (void)startScanning {
    if (self.session.isRunning) {
        return;
    }
    [self.session startRunning];
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
}

- (void)closureScanning {
    if (!self.session.isRunning) {
        return;
    }
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
}

- (void)scanCaptureWithValueString:(NSString *)valueString {
    [self closureScanning];
}

- (CGRect)rectOfInterest {
    return CGRectMake(0, 0, 1, 1);
}

- (void)updateRectOfInterest {
    self.output.rectOfInterest = [self.previewLayer metadataOutputRectOfInterestForRect:[self rectOfInterest]];
}

#pragma mark - 私有方法

// 创建扫描
- (void)creatScanning {

    // 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    // 初始化链接对象
    self.session = [[AVCaptureSession alloc] init];
    
    // 高质量采集率
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [self.session addInput:input];
    [self.session addOutput:self.output];
    
    // 设置扫码支持的编码格式
    self.output.metadataObjectTypes = @[
                                        AVMetadataObjectTypeUPCECode,
                                        AVMetadataObjectTypeCode39Code,
                                        AVMetadataObjectTypeCode39Mod43Code,
                                        AVMetadataObjectTypeEAN13Code,
                                        AVMetadataObjectTypeEAN8Code,
                                        AVMetadataObjectTypeCode93Code ,
                                        AVMetadataObjectTypeCode128Code ,
                                        AVMetadataObjectTypePDF417Code,
                                        AVMetadataObjectTypeQRCode,
                                        AVMetadataObjectTypeAztecCode];
    
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
}

@end
