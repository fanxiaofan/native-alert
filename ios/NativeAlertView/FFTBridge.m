//
//  FFTBridge.m
//  TabScroll
//
//  Created by 樊丰廷 on 2018/7/10.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "FFTBridge.h"

@implementation FFTBridge
//在js中直接使用
RCT_EXPORT_MODULE(FFTBridge);

RCT_EXPORT_METHOD(showAlert:(NSString *)title msg:(NSString *)msg){
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
  
  [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end

