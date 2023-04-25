//
//  Book.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import Foundation

struct Book: Codable {
    let title: String?
    let subtitle: String?
    let isbn13: String?
    let price: String?
    let image: String?
    let url: String?
}
