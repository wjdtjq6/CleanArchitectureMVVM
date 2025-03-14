//
//  NetworkManager.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/24/25.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(url: String, method: HTTPMethod, parameters : Parameters?) async -> Result<T, NetworkError>
}

public final class NetworkManager {
    private let session: SessionProtocol
    init(session: SessionProtocol) {
        self.session = session
    }
    private let tokenHeader: HTTPHeaders = {
        let tokenHeader = HTTPHeader(name: "Authorization", value: "Bearer \(APIKey.apiKey)")
        return HTTPHeaders([tokenHeader])
    }()
    
    func fetchData<T: Decodable>(url: String, method: HTTPMethod, parameters : Parameters? = nil) async -> Result<T, NetworkError> {
        guard let url = URL(string: url) else {
            return .failure(.urlError)
        }
        
        let result = await session.request(url, method: method, parameters: parameters,headers: tokenHeader).serializingData().response
        
        if let error = result.error {
            return .failure(.requestFailed(error.localizedDescription))
        }
        
        guard let data = result.data else {
            return .failure(.dataNil)
        }
        
        guard let response = result.response else {
            return .failure(.invalidResponse)
        }
        
        if 200..<400 ~= response.statusCode {
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure(.failToDecode(error.localizedDescription))
            }
        } else {
            return .failure(.serverError(response.statusCode))
        }
        
    }
}
