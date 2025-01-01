/**
 * @file Repos.swift
 * @author Krisna Pranav
 * @brief Repos
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

import Foundation

func reposEncode(reposUrl: [String]) -> String {
    let repoUrlString = reposUrl.map { ($0) }.joined(separator: ",")
    
    if let data = repoUrlString.data(using: .utf8) {
        return "repo[" + data.base64EncodedString() + "]"
    }
    
    return ""
}

func compareVersions(_ version1: String, _ version2: String) -> Bool {
    let components1 = version1.components(separatedBy: CharacterSet(charactersIn: "."))
    let components2 = version2.components(separatedBy: CharacterSet(charactersIn: "."))
    
    for (component1, component2) in zip(components1, components2) {
        if let number1 = Int(component1), let number2 = Int(component2) {
            if number1 != number2 {
                return number1 > number2
            }
        } else {
            
        }
    }
    
    return components1.count >= components2.count
    
}
