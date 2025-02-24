//
//  NetworkManager.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/24/25.
//

import Foundation
import Alamofire

public final class NetworkManager {
    private let session: SessionProtocol
    init(session: SessionProtocol) {
        self.session = session
    }
    private let tokenHeader: HTTPHeaders = ["Authorization": "Bearer \(APIKey.APIKey)"]
    
    func fetchData<T: Decodable>(url: String, parameters : Parameters?) async -> Result<T, NetworkError> {
        guard let url = URL(string: url) else {
            return .failure(.urlError)
        }
        let result = await session.request(url, headers: tokenHeader).response
        if let error = result.error { retrun .fail}
        
    }
}
