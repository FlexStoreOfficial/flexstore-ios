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
