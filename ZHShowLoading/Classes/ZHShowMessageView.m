//
//  ZHShowMessageView.h
//  zhonghe
//
//  Created by 韩旭 on 2017/9/7.
//  Copyright © 2017年 韩旭. All rights reserved.
//

#import "ZHShowMessageView.h"
#import "MMProgressHUD.h"
@implementation ZHShowMessageView
static NSMutableArray *arr;
static NSMutableArray *newarr;
+ (void)showErrorWithMessage:(NSString *)message
{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleSwingRight];
    [MMProgressHUD setDisplayStyle:MMProgressHUDDisplayStyleBordered];
    [MMProgressHUD dismissWithError:nil title:message afterDelay:2.0];
    
}
+ (void)showSuccessWithMessage:(NSString *)message
{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleSwingRight];
    [MMProgressHUD setDisplayStyle:MMProgressHUDDisplayStyleBordered];
    [MMProgressHUD dismissWithSuccess:nil title:message afterDelay:2.0];
}
+ (void)showStatusWithMessage:(NSString *)message
{
    if(!arr){
        arr = [NSMutableArray array];
        for (int i=0;i<3;i++) {
            NSString *str= [NSString stringWithFormat:@"ZHShowLoading.bundle/status%d",i];
            UIImage *img = [UIImage imageNamed:str];
            [arr addObject:img];
        }
    }
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
    [MMProgressHUD showWithTitle:nil status:message images:[arr copy]];
}
+ (void)showStatusWithMessageNew:(NSString *)message
{
    if(!newarr){
        newarr = [NSMutableArray array];
        for (int i=0;i<30;i++) {
            NSString *str= [NSString stringWithFormat:@"ZHShowLoading.bundle/112440_%02d",2*i+1];
            UIImage *img = [UIImage imageNamed:str];
            [newarr addObject:img];
        }
    }
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
    [MMProgressHUD showWithTitle:nil status:message images:[newarr copy]];
}
+ (void)dismissSuccessView:(NSString *)message
{
   [MMProgressHUD dismissWithSuccess:message];
}
+ (void)dismissErrorView:(NSString *)message
{
    [MMProgressHUD dismissWithError:message];
}
+ (void)dismiss
{
    [MMProgressHUD dismiss];
}
@end
