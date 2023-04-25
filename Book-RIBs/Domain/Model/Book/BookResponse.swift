//
//  BookResponse.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import Foundation

struct BookResponse: Codable {
    let error: String
    let total: String
    let page: String?
    var books: [Book]
}
