//
//  API.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/29.
//

import Foundation

class API {
    enum APIError: LocalizedError {
        case urlNotSupport
        case noData
        
        var errorDescription: String? {
            switch self {
            case .urlNotSupport: return "URL NOT Supported"
            case .noData: return "Has No Data"
            }
        }
    }
    
    static let shared: API = API()
    
    private lazy var defaultSession = URLSession(configuration: .default)
    
    private init() { }
   
    func get1(completionHandler: @escaping (Result<[SearchModel], APIError>) -> Void) {
        guard let url = URL(string: "\(Config.baseURL)/posts") else {
            completionHandler(.failure(.urlNotSupport))
            return
        }
        let resource = Resource<[SearchModel]>(url: url)
        defaultSession.load(resource) { userDatas, _ in
            guard let data = userDatas, !data.isEmpty else {
                completionHandler(.failure(.noData))
                return
            }
            completionHandler(.success(data))
        }
    }
    
//    func get2(completionHandler: @escaping (Result<[SearchModel], APIError>) -> Void) {
//        let resource = Resource<[SearchModel]>(url: "\(Config.baseURL)/posts", parameters: ["userId": "1"])
//        defaultSession.load(resource) { userDatas, _ in
//            guard let data = userDatas, !data.isEmpty else {
//                completionHandler(.failure(.noData))
//                return
//            }
//            completionHandler(.success(data))
//        }
//    }
    
}
