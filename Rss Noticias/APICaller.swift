//
//  APICaller.swift
//  Rss Noticias
//
//  Created by Akel Barbosa on 30/06/22.
//

import Foundation

struct API_KEY  {
    static let Api_Key: String = ""
    static let baseUrl: String = "https://newsapi.org/v2/top-headlines?country="//"https://newsdata.io/api/1/news?apikey="
    static let county: String = "co"
}


enum APIError {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getNews(completion: @escaping (Result<[News], Error>) -> Void) {
        guard let url = URL(string: "\(API_KEY.baseUrl)\(API_KEY.county)&apiKey=\(API_KEY.Api_Key)" ) else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(NewsRecent.self, from: data)
                completion(.success(results.articles))
            } catch {
                completion(.failure(APIError.failedTogetData as! Error))
            }
            

        }
        
        task.resume()
    }
}


