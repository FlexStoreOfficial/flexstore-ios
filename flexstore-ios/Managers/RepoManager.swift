//
//  RepoManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 05/01/25.
//

import SwiftUI

enum StringOrDouble: Decodable, Encodable, Equatable {
    case string(String)
    case double(Double)
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            if let double = try? container.decode(Double.self) {
                self = .double(double)
            } else if let string = try? container.decode(String.self) {
                self = .string(string)
            } else {
                throw new Error.couldNotFindStringOrDouble
            }
        } catch {
            throw Error.couldNotFindStringOrDouble
        }
    }
    
    enum Error: Swift.Error {
        case couldNotFindStringOrDouble
    }
    
}
