//
//  ResponseModel.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import Foundation

struct Response: Codable {
    let status: String
    let totalResults: Int
}

struct Articles {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct Source {
    let id: String
    let name: String
}
