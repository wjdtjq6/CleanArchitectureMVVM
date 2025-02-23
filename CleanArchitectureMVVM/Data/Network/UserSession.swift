//
//  UserSession.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/23/25.
//

import Foundation
import Alamofire

//Session

public protocol SessionProtocol {
    func request(_ url: URLConvertible,
                 method: HTTPMethod,
                 parameters: Parameters?,
                 headers: HTTPHeaders?) -> DataRequest
}
  
class UserSession {
    private var session: SessionManager
    init(session: SessionManager) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        self.session = SessionManager(configuration: config)
    }
    
    func request(_ url: URLConvertible,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 headers: HTTPHeaders? = nil) -> DataRequest {
        return session.request(url, method: method, parameters: parameters, headers: headers)
    }
}
