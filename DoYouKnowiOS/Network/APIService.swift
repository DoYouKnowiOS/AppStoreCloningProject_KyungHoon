//
//  APIService.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/29.
//

import Foundation
import RxSwift

let SearchUrl = "https://itunes.apple.com/search"

class APIService {
    static func getSearch(onComplete: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: SearchUrl)!) { data, res, err in
            if let err = err {
                onComplete(.failure(err))
                return
            }
            guard let data = data else {
                let httpResponse = res as! HTTPURLResponse
                onComplete(.failure(NSError(domain: "no data",
                                            code: httpResponse.statusCode,
                                            userInfo: nil)))
                return
            }
            onComplete(.success(data))
        }.resume()
    }
}
