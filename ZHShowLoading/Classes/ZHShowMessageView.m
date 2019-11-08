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
+(UIImage *)loadBundleImage:(NSString *)imageName{
    
    // 获取当前的bundle,self只是在当前pod库中的一个类，也可以随意写一个其他的类
    NSBundle *curr = [NSBundle bundleForClass:[self class]];
    //NSURL *url = [curr URLForResource:@"ZHShowLoading" withExtension:@"bundle"];
    NSString *currentBundleName = curr.infoDictionary[@"CFBundleName"];
    // 获取图片的路径
    NSString *imagePath = [curr pathForResource:imageName ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle",currentBundleName]];
    // 获取图片
    UIImage *imageFile = [UIImage imageWithContentsOfFile:imagePath];
    if(!imageFile){
        imageFile = [UIImage imageNamed:imageName inBundle:curr compatibleWithTraitCollection:nil];
    }
    return imageFile;
}
+ (void)showStatusWithMessage:(NSString *)message
{
    if(!arr){
        arr = [NSMutableArray array];
        for (int i=0;i<3;i++) {
            NSString *str= [NSString stringWithFormat:@"status%d",i];
            UIImage *img = [self loadBundleImage:str];
            if(img){
                [arr addObject:img];
            }
                
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
            NSString *str= [NSString stringWithFormat:@"112440_%02d",2*i+1];
            UIImage *img = [self loadBundleImage:str];
            if(img){
                [newarr addObject:img];
            }
           
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
