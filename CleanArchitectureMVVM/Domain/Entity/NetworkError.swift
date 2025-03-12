//
//  NetworkError.swift
//  CleanArchitectureMVVM
//
//  Created by 소정섭 on 2/21/25.
//

import Foundation

public enum NetworkError: Error {
    case urlError
    case invalidResponse
    case failToDecode(String)
    case dataNil
    case serverError(Int)
    case requestFailed(String)
    
    var description: String {
        switch self {
        case .urlError:
            "url이 올바르지 않습니다"
        case .invalidResponse:
            "응답값이 유요하지 않습니다"
        case .failToDecode(let message):
            "디코딩 에러 \(message)"
        case .dataNil:
            "데이터가 없습니다"
        case .serverError(let statusCode):
            "서버에러 \(statusCode)"
        case .requestFailed(let message):
            "서버 요청 실패 \(message)"
        }
    }
}
