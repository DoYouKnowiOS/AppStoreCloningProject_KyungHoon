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
    
    
    static let shared = API()
    
    private lazy var defaultSession = URLSession(configuration: .default)
    
    private init() { }
   
    func getRequest(completionHandler: @escaping (Result<[SearchModel], APIError>) -> Void) {
        guard let url = URL(string: "\(SearchUrl)?term=kakao&country=kr&media=software") else {
            completionHandler(.failure(.urlNotSupport))
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { completionHandler(.failure(.urlNotSupport))
                return }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else
            { completionHandler(.failure(.urlNotSupport))
                return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else {
                completionHandler(.failure(.urlNotSupport)) //case 추가하기(각상황에맞게)
                return
            }
            
            guard let resultData = data else { completionHandler(.failure(.urlNotSupport))
                return }
            
            let decoder = JSONDecoder()
            do {
                let searchResult = try decoder.decode(SearchModel.self, from: resultData)
                completionHandler(.success([searchResult]))
                print(searchResult.resultCount)
                print(searchResult.results)
//                print(searchResult.term)
//                print(searchResult.media)
            } catch(let error) {
                print(error)
                completionHandler(.failure(.urlNotSupport))
            }
        }
        dataTask.resume()
        
        
        
        
//        let resource = Resource<[SearchModel]>(url: url)
//        URLSession.load(resource: String) { SearchViewController, _ in
//            guard let data = SearchViewModel, !data.isEmpty else {
//                completionHandler(.failure(.noData))
//                return
//            }
//            completionHandler(.success(data))
//        }
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
