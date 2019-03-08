//
//  GlobalNewsAPI.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class GlobalNewsAPIClient {

    static func globalNewsAPIClient(completionHandler: @escaping(Error?,[ArticleInfo]?) -> Void) {
        let endpointUrl = "https://newsapi.org/v2/everything?q=world&from=2019-02-17&sortBy=publishedAt&apiKey=\(Secretkeys.newsAPIKey)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointUrl) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else {
                if let data = data {
                    do {
                    let news = try JSONDecoder().decode(GlobalNews.self, from: data)
                        completionHandler(nil, news.articles)
                
                    } catch {
                    completionHandler(error, nil)
                    }
                }
            }
        }
        
        
    }

    
    
}

