//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Jackie Lu on 2023/10/28.
//

import Foundation

struct Constants {
    static let API_KEY = "f26a765eb55eeb586197cc6a9a251c73"
    static let baseURL = "https://api.themoviedb.org"
}

enum APICallor {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
