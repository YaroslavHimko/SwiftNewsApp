//
//  NewsService.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 2.04.21.
//

import Foundation
import Moya

enum NewsService {
    case getNews
}

extension NewsService: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        return Constants.relativePath
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return Constants.contentType
    }
    
    
}
