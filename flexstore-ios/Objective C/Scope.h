/**
 * @file Scope.h
 * @author Krisna Pranav
 * @brief Scope
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */


#ifndef SCOPE_H
#define SCOPE_H

typedef FS_ENUM(FSInteger, FSScope) {
    FSRegistryScopeSingleton, FSRegistryScopePrototype;
}
