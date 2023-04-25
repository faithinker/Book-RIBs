//
//  BookAPI.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import Foundation
import Moya

enum BookAPI: TargetType {
    case new
    case search(query: String, page: Int)
    case detail(isbn13: String)
}

extension BookAPI {
    var baseURL: URL {
        guard let url = URL(string: "https://api.itbook.store/1.0/") else {
            fatalError("baseURL Error")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .new:
            return "new"
        case .detail(let isbn13):
            return "books/\(isbn13)"
        case .search(let query, let page):
            return "search/\(query)/\(page)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Task {
        switch self {
        default: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json; charset=utf-8"]
    }
}
