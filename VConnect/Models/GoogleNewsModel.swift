//
//  GoogleNewsModel.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct WorldNews: Codable {
    let news: GlobalNews
}

struct GlobalNews: Codable {
    let articles: [ArticleInfo]
}
struct ArticleInfo: Codable {
    let source: SourceInfo
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct SourceInfo: Codable {
    let id: String?
    let name: String
}
