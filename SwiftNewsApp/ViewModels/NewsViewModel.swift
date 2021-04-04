//
//  NewsViewModel.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 2.04.21.
//

import Foundation
import RxSwift

class NewsViewModel {
    
    func fetchNews() -> Single<ResponseModel> {
        return .create { observer in
            NetworkManager.shared.getNews()
                .subscribe(onSuccess: { newsResponse in
                    observer(.success(newsResponse))
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
}
