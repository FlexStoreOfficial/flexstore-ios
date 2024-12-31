/**
 * @file Registered.h
 * @author Krisna Pranav
 * @brief Registered
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */


#import <Foundation/Foundation.h>
#import "Scope.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSRegistered: NSObject

@property(nonatomic, readonly) Scope type;

@property(nonatomic, readonly) id singletonObject;

@property(nonatomic, readonly) id (^prototypeBlock)(void);

- (instancetype) initWithSingleton: (id) object;

- (instancetype) initWithPrototypeBlock: (id (^)(void))block;

@end

NS_ASSUME_NONNULL_END
