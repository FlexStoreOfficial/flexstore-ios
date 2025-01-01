/**
 * @file Registry.m
 * @author Krisna Pranav
 * @brief Registry
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

#import <Foundation/Foundation.h>
#import "Registry.h"
#import "Registerd.h"

@interface FSRegistered ()

@property(nonatomic, strong) NSMutableDictionary<NSString*, FSRegistered *> *registry;

@end

@implementation FSRegistry

#pragma mark - initialization

+ (instancetype)sharedInstance {
  static dispatch_once_t token;
  static id sharedInstance = nil;
    
  dispatch_once(&token, ^{
    sharedInstance = [[[self class] alloc] init];
  });
    
  return sharedInstance;
}

- (instancetype)init {
    if(self == [super init]) {
        _registry = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

#pragma mark - internal func

- (void)register:(Protocol *_Null_unspecified)aProtocol
           scope:(NVScope)scope
factory:(nonnull id _Nonnull (^)(void))factory {
    switch(scope) {
        case FSRegistryScopeSingleton:
            [self registerSingleton: aProtocol factory: factory];
            break;
        case FSRegistryScopePrototype:
            [self registerPrototype:aProtocol factory:factory];
            break;
    }
}

- (nonnull id)resolve:(Protocol *_Null_unspecified)aProtocol {
    NSString *key = [self makeKey: aProtocol];
    FSRegistered *registered = _registry[key];
    
    if (registered != nil) {
        switch (registered.type) {
            case FSRegistryScopeSingleton:
                return registered.singletonObject;
            case FSRegistryScopePrototype:
                return registered.prototypeBlock();
        }
    }
    
    return nil;
}

- (void)remove:(Protocol *)aProtocol {
    NSString *key = [self makeKey: aProtocol];
    [_registry removeObjectForKey:key];
}


- (nonnull NSString *)makeKey:(Protocol *_Null_unspecified)aProtocol {
    NSString *key = NSStringFromProtocol(aProtocol);
    return key;
}

- (void)registerSingleton:(Protocol *_Null_unspecified)aProtocol
                  factory:(nonnull id _Nonnull (^)(void))factory {
  NSString *key = [self makeKey:aProtocol];
    _registry[key] = [[FSRegistered alloc] initWithSingleton:factory()];
}

- (void)registerPrototype:(Protocol *_Null_unspecified)aProtocol
                  factory:(nonnull id _Nonnull (^)(void))factory {
  NSString *key = [self makeKey:aProtocol];
    _registry[key] = [[FSRegistered alloc] initWithPrototypeBlock:factory];
}

@end
