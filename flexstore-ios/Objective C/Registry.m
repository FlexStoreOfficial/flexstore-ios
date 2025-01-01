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

@end
