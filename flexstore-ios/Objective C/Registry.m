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
