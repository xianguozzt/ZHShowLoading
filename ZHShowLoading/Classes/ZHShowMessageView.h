//
//  ZHShowMessageView.h
//  zhonghe
//
//  Created by 韩旭 on 2017/9/7.
//  Copyright © 2017年 韩旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHShowMessageView : NSObject

+ (void)showErrorWithMessage:(NSString *)message;

+ (void)showSuccessWithMessage:(NSString *)message;

+ (void)showStatusWithMessage:(NSString *)message;

+ (void)showStatusWithMessageNew:(NSString *)message;

+ (void)dismissSuccessView:(NSString *)message;

+ (void)dismissErrorView:(NSString *)message;

+ (void)dismiss;
@end
