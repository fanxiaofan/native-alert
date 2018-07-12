//
//  FFTBridge.m
//  TabScroll
//
//  Created by 樊丰廷 on 2018/7/10.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "FFTBridge.h"
#import <React/RCTConvert.h>

@implementation FFTBridge
//在js中直接使用
RCT_EXPORT_MODULE(FFTBridge);

RCT_EXPORT_METHOD(showAlert:(NSString *)title msg:(NSString *)msg sure:(NSString *)sure cancel:(NSString *)cancel sureEvent:(RCTResponseSenderBlock)sureCallback cancelEvent:(RCTResponseSenderBlock)cancelCallback){
    
    NSLog(@"hello showAlert");
    
    UIViewController *controller = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    if (sure) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (sureCallback) {
                sureCallback(@[@[@"sure"]]);
            }
        }];
        [alert addAction:sureAction];
    }
    
    if (cancel) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (cancelCallback) {
                cancelCallback(@[@[@"cancel"]]);
            }
        }];
        [alert addAction:cancelAction];
    }
    
    [controller presentViewController:alert animated:YES completion:nil];
}


RCT_REMAP_METHOD(printDate, date1:(nonnull NSNumber *)d1 date2:(nonnull NSNumber *)d2 resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    NSDate* dt1 = [RCTConvert NSDate:d1];
    NSDate* dt2 = [RCTConvert NSDate:d2];
    NSComparisonResult result = [dt1 compare:dt2];
    switch(result){
        case NSOrderedAscending:{
            NSLog(@"比较结果%@",@"开始时间小于结束时间");
        }break;
        case NSOrderedDescending:{
            NSLog(@"比较结果%@",@"开始时间大于结束时间");
        }break;
        default:
            break;
    }
    NSArray *events = [NSArray arrayWithObjects:@"测试结果",nil];
    if (events) {
        resolve(events);
    } else {
        reject(@"",@"",nil);
    }
}

@end

