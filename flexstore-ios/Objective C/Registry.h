/**
 * @file Registry.h
 * @author Krisna Pranav
 * @brief Registry
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

#import <Foundation/Foundation.h>
#import "Scope.h"

NS_ASSUME_NONNULL_BEGIN

@interface Registry: NSObject

+ (instancetype)sharedInstance;

- (void)register:(Protocol *_Null_unspecified)aProtocol
        scope:(NVScope)scope
        factory:(id (^)(void))factory;



@end

NS_ASSUME_NONNULL_END
