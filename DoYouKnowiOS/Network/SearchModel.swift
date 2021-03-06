//
//  SearchModel.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/28.
//

import Foundation

struct SearchModel: Decodable {
    let resultCount: Int
    let results: [SearchInsideModel]
}

struct SearchInsideModel: Decodable {
    let trackCensoredName: String
    let wrapperType: String
    let kind: String
}

struct PostSearchModel: Codable {
    let term: String
    let country : String
    let media : String
    
    init() {
        self.term = "카카오톡"
        self.country = "kr"
        self.media = "software"
    }
}
