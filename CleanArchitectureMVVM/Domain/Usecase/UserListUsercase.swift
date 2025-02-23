//
//  UserListUsercase.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/23/25.
//

import Foundation

public protocol UserListUsercaseProtocol {
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError>//유저 리스트 불러오기 (원격)
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>//전체 즐겨찾기 리스트 불러오기
    func saveFavoriteUSer(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
    
    //배열 -> Dictionary [초성: [유저리스트]]
    //유저리스트 - 즐겨찾기 포함된 유저인지
}

public struct UserListUsercase: UserListUsercaseProtocol {
    private let repository: UserRepositoryProtocol
    
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    public func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError> {
        await repository.fetchUser(query: query, page: page)
    }
    
    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        repository.getFavoriteUsers()
    }
    
    public func saveFavoriteUSer(user: UserListItem) -> Result<Bool, CoreDataError> {
        repository.saveFavoriteUSer(user: user)
    }
    
    public func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
        repository.deleteFavoriteUser(userID: userID)
    }
}
