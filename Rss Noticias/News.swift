//
//  News.swift
//  Rss Noticias
//
//  Created by Akel Barbosa on 3/07/22.
//

import Foundation

struct NewsRecent: Codable {
    let articles: [News]
}

struct News: Codable {
    let title: String?
    let description: String?
    let url: String?
    let content: String?
    let urlToImage: String?
   
    
}
