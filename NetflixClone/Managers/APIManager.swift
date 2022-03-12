//
//  APIManager.swift
//  NetflixClone
//
//  Created by Kostya Lee on 07/03/22.
//

import UIKit

/*
 case .search:
    urlString = "\(Constants.base)/query=\(query.correctTextIfNeeded())?api_key=\(Constants.KEY)&language=en-US&page=1"
 */
// api key: f17b6f6ea08d3461c44cff2eaf15768a
// https://api.themoviedb.org/3/movie/76341?api_key=<<api_key>>
// https://api.themoviedb.org/3/movie/76341?api_key=f17b6f6ea08d3461c44cff2eaf15768a
// Example request: https://api.themoviedb.org/3/movie/550?api_key=f17b6f6ea08d3461c44cff2eaf15768a
// Upcoming: https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1

enum Category {
    case trending
    case upcoming
    case headerMovie
}

class APIManager {
    static let shared = APIManager()
    func requestData(ofType category: Category,
                     completion: @escaping (Result<CategoryAPI, Error>) -> Void) {

        let url: URL
        switch category {
        case .trending:
            url = URL.trending
        case .upcoming:
            url = URL.upcoming
        case .headerMovie:
            url = URL.headerMovie
            print("Requesting header movie...")

        default:
            print("Loool")

        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(CategoryAPI.self, from: data)
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
