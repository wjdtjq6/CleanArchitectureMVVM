//
//  UserListItem.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/21/25.
//

import Foundation

struct UserListResult: Decodable {
    let totalCoubn: Int
    let incompleteResults: Bool
    let items: [UserListItem]
    
    enum CodingKeys: String, CodingKey {
        case totalCoubn = "total_count"
        case incompleteResults = "incomeplete_results"
        case items
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCoubn = try container.decode(Int.self, forKey: .totalCoubn)
        self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        self.items = try container.decode([UserListItem].self, forKey: .items)
    }
}

struct UserListItem: Decodable {
    let id: Int
    let login: String
    let imageURL: String
    
    enum CodingKeys: CodingKey {
        case id
        case login
        case imageURL
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.login = try container.decode(String.self, forKey: .login)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}
