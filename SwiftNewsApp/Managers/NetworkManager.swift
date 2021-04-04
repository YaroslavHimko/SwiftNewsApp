//
//  NetworkManager.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import Foundation
import RxSwift
import Moya

struct NetworkManager {
    public static let shared = NetworkManager()
    
    private let provider = MoyaProvider<NewsService>()
    
    private init() {}
    
    func getNews() -> Single<ResponseModel> {
        return provider.rx
            .request(.getNews)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ResponseModel.self)
    }
}


