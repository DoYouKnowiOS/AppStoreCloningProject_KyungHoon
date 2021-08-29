//
//  HttpMethod.swift
//  DoYouKnowiOS
//
//  Created by KimKyungHoon on 2021/08/29.
//

import Foundation

enum HttpMethod<Body> {
    case get
}

extension HttpMethod {
    var method: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
