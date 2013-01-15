//
//  FWUtilities.h
//  FWUtilities
//
//  Created by Kent Vu on 10/18/12.
//  Copyright (c) 2012 Freewjngs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FWUtilities : NSObject

+ (FWUtilities *)sharedUtilities;

// quick method to close keyboard at anywhere
+ (void)hideKeyboard;

// quick use SVProgressHUD
+ (void)showActivityIndicatorDefault;
+ (void)showActivityIndicatorWithMessage:(NSString *)msg;
+ (void)showActivityIndicatorWithMessage:(NSString *)msg image:(UIImage *)img;
+ (void)hideActivityIndicatorWithSuccessMessage:(NSString *)msg;
+ (void)hideActivityIndicatorWithErrorMessage:(NSString *)msg;

// quick show alert
+ (void)showAlertWithMessage:(NSString *)msg;
+ (void)showAlertWithMessage:(NSString *)msg isError:(BOOL)error;
+ (void)showAlertWithMessage:(NSString *)msg isError:(BOOL)error delegate:(id)delegate;

// quick get Document, Cache path just with file path, ex: @"/db.sqlite"
+ (NSString *)pathFromDocumentFolderForFilePath:(NSString *)filePath;
+ (NSString *)pathFromCacheFolderForFilePath:(NSString *)filePath;

// quick get file path from Bundle
+ (NSString *)pathFromBundleForFileNamed:(NSString *)fileName;

// quick check Internet connection
// notice: nessessary framework *******************************************************
// - SystemConfiguration.framework
+ (BOOL)isInternetConnectionAvailable;

// quick convert
+ (NSString *)toStringFromInt:(NSInteger)number;
+ (NSString *)toStringFromDouble:(double)number;

@end
