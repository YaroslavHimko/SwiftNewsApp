//
//  ResponseModel.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import Foundation

struct ResponseModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    var title: String?
    var description: String
    let url: String
    var urlToImage: String?
    let publishedAt: String
    let content: String
}

struct Source: Codable {
    let id: String?
    let name: String
}
