//
//  UserRepositoryProtocol.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/23/25.
//

import Foundation

public protocol UserRepositoryProtocol {
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError>//유저 리스트 불러오기 (원격)
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>//전체 즐겨찾기 리스트 불러오기
    func saveFavoriteUSer(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>

}
