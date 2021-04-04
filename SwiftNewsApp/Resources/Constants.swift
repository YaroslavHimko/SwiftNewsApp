//
//  Constants.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 2.04.21.
//

import Foundation

class Constants {
    static let baseUrl: String = "https://newsapi.org/v2/everything?q=apple&from=\(Date.formattedDate(date: Date.yesterday)))&sortBy=publishedAt&apiKey=\(ConfigValues.get().clientSecret)"
    static let relativePath: String = "/"
    static let contentType: [String: String]? = ["Content-type": "application/json"]
    static let defaultImage: String = "https://picsum.photos/200"
}
