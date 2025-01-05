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
    
    func toString() -> String {
        switch self {
        case .string(let stringValue):
            return stringValue
        case .double(let doubleValue):
            return String(doubleValue)
        }
    }
}

struct Repo: Decodable, Equatable, Hashable {
    var name: String?
    var website: String?
    var iconURL: String?
    var headerURL: String?
    var featuredApps: [String]?
    var tintColor: String?
    var apps: [Application]
    var news: [News]?

    enum CodingKeys: String, CodingKey {
        case name, iconURL, headerURL, featuredApps, tintColor, apps, news
    }
}

struct RepoMemory: Identifiable {
    let id = UUID()
    var url: String
    var data: Repo
}

struct BadRepoMemory: Identifiable {
    let id = UUID()
    var url: String
}

struct ErrorMemory: Identifiable {
    let id = UUID()
    var url: String
    var data: Repo
}

struct Version: Codable, Equatable {
    var absoluteVersion: String?
    var version: String
    var date: String
    var localizedDescription: String?
    var downloadURL: String
    var size: StringOrDouble?
    var minOSVersion: String?
    var maxOSVersion: String?
}

struct News: Codable, Hashable {
    var title: String?
    var caption: String?
    var date: String?
    var tintColor: String?
    var imageURL: String?
    var url: String?
    var appID: String?
}
