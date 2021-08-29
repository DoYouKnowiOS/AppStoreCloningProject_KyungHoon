//
//  SearchModel.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/28.
//

import Foundation

struct SearchModel: Decodable {
    let term: String
    let country : String
    let media : String
    
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
