//
//  UserCoreData.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 3/14/25.
//

import Foundation
import CoreData

public protocol UserCoreDataProtocol {
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>//전체 즐겨찾기 리스트 불러오기
    func saveFavoriteUSer(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
}

public struct UserCoreData: UserCoreDataProtocol {
    private let viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }
    
    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        let fetrchRequest: NSFetchRequest<FavoriteUser> = FavoriteUser.fetchRequest()
        do {
            let result = try viewContext.fetch(fetrchRequest)
            let userList: [UserListItem] = result.compactMap{ favoriteUSer in
                guard let login = favoriteUSer.login, let imageURL = favoriteUSer.imageURL else { return nil }
                return UserListItem(id: Int(favoriteUSer.id), login: login
                                    , imageURL: imageURL)
            }
            return .success(userList)
        } catch {
            return .failure(.readError(error.localizedDescription))
        }
    }
    
    public func saveFavoriteUSer(user: UserListItem) -> Result<Bool, CoreDataError> {
        guard let entity = NSEntityDescription.entity(forEntityName: "FavoriteUser", in: viewContext) else { return .failure(.entityNotFound("FavoriteUser"))}
            let userObject = NSManagedObject(entity: entity, insertInto: viewContext)
        userObject.setValue(user.id, forKey: "id")
        userObject.setValue(user.login, forKey: "login")
        userObject.setValue(user.imageURL, forKey: "imageURL")
        do {
            try viewContext.save()
            return .success(true)
        } catch {
            return .failure(.saveError(error.localizedDescription))
        }
    }
    
    public func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
        let fetchRequest: NSFetchRequest<FavoriteUser> = FavoriteUser.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", userID)
        do {
            let result = try viewContext.fetch(fetchRequest)
            result.forEach { FavoriteUser in
                viewContext.delete(FavoriteUser)
            }
            try viewContext.save()
            return .success(true)
        } catch {
            return .failure(.deleteError(error.localizedDescription))
        }
    }
    
}
