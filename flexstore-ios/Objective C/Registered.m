/**
 * @file Registered.m
 * @author Krisna Pranav
 * @brief Registered
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

#import "Registerd.h"

@implementation FSRegistered

#pragma mark - initialization

- (instancetype)initWithSingleton:(id)object {
    self = [super init];
    
    if (self) {
        _type = FSRegistryScopeSingleton;
        _singletonObject = object;
    }
    
    return self;
}

- (instancetype)initWithPrototypeBlock:(id  _Nonnull (^)(void))block {
    self = [super init];
    
    if (self) {
        _type = FSRegistryScopePrototype;
        _prototypeBlock = [block copy];
    }
    
    return self;
}

@end
