//
//  UserNetwork.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 3/12/25.
//

import Foundation

final public class Usertwork {
    private let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError> {
        let url = "https://api.github.comn/search/users?q=\(query)&page=\(page)"
        return await manager.fetchData(url: url, method: .get)
    }
}
