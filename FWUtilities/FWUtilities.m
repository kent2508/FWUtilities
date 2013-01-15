//
//  FWUtilities.m
//  FWUtilities
//
//  Created by Kent Vu on 10/18/12.
//  Copyright (c) 2012 Freewjngs. All rights reserved.
//

#import "FWUtilities.h"
#import "SVProgressHUD.h"
#import "Reachability.h"

@implementation FWUtilities

+ (FWUtilities *)sharedUtilities {
    static FWUtilities *_sharedUtilities = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedUtilities = [[FWUtilities alloc] init];
    });
    return _sharedUtilities;
}

#pragma mark -
+ (void)hideKeyboard {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

#pragma mark -
+ (void)showActivityIndicatorDefault {
    
    [SVProgressHUD show];
}

+ (void)showActivityIndicatorWithMessage:(NSString *)msg {
    
    [SVProgressHUD showWithStatus:msg];
}

+ (void)showActivityIndicatorWithMessage:(NSString *)msg image:(UIImage *)img {
    
    [SVProgressHUD showImage:img status:msg];
}

+ (void)hideActivityIndicatorWithSuccessMessage:(NSString *)msg {
    
    [SVProgressHUD showSuccessWithStatus:msg];
}

+ (void)hideActivityIndicatorWithErrorMessage:(NSString *)msg {
    
    [SVProgressHUD showErrorWithStatus:msg];
}

#pragma mark - alert
+ (void)showAlertWithMessage:(NSString *)msg {
    
    [FWUtilities showAlertWithMessage:msg isError:NO];
}

+ (void)showAlertWithMessage:(NSString *)msg isError:(BOOL)error {
    
    [FWUtilities showAlertWithMessage:msg isError:error delegate:nil];
}

+ (void)showAlertWithMessage:(NSString *)msg isError:(BOOL)error delegate:(id)delegate {
    
    NSString *title = error ? @"Error!" : @"Hello!";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:delegate
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark -
+ (NSString *)pathFromDocumentFolderForFilePath:(NSString *)filePath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@", filePath]];
}

+ (NSString *)pathFromCacheFolderForFilePath:(NSString *)filePath {

    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/%@", filePath]];
}

#pragma mark -
+ (NSString *)pathFromBundleForFileNamed:(NSString *)fileName {
    NSArray *nameComponents = [fileName componentsSeparatedByString:@"."];
    if (!nameComponents || nameComponents.count == 0) {
        [FWUtilities showAlertWithMessage:@"File name is invalid syntax." isError:YES];
        return nil;
    }
    NSString *extendedNameComponent = [nameComponents lastObject];
    return [[NSBundle mainBundle] pathForResource:fileName ofType:extendedNameComponent];
}

#pragma mark - check internet connection
+ (BOOL)isInternetConnectionAvailable {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable) return NO;
    else return YES;
}

#pragma mark - quick convert
+ (NSString *)toStringFromInt:(NSInteger)number {
    
    __autoreleasing NSString *result  = [[NSString alloc] initWithFormat:@"%d", number];
    return result;
}

+ (NSString *)toStringFromDouble:(double)number {
    
    __autoreleasing NSString *result  = [[NSString alloc] initWithFormat:@"%f", number];
    return result;
}

@end
