/**
 * @file flexstore-ios-Bridging-Header.h
 * @author Krisna Pranav
 * @brief Flexstore ios Bridging Header
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern int spawnRoot(NSString* path, NSArray* args);

@class BSMonotonicReferenceTime, NSArray, NSNumber, NSString, NSURL, SBSApplicationShortcutService, SBSApplicationShortcutServiceFetchResult;

@interface SBFApplication : NSObject {
    NSURL * _bundleURL;
}

@property (nonatomic, readonly) NSURL *bundleURL;
- (void)cxx_destruct;
- (id)bundleURL;
- (id)init;
- (id)initWithApplicationBundleIdentifier:(id)arg1;
@end

@interface
 LSApplicationWorkspace : NSObject
- (id)allInstalledApplications;
- (BOOL)unregisterApplication:(NSURL *)url;
- (BOOL)registerApplication:(NSURL *)url;
@end


@interface

 LSBundleProxy
@property
(readonly, nonatomic) NSURL *bundleURL;

@end


@interface

 LSApplicationProxy : LSBundleProxy

@end

@interface UIImage (Private)

+(id)_applicationIconImageForBundleIdentifier:(id)arg0 format:(int)arg1 scale:(CGFloat)arg2;

@end
