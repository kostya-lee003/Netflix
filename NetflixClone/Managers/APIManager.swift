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

struct Constants {
    static let KEY = "f17b6f6ea08d3461c44cff2eaf15768a"
    static let base = "https://api.themoviedb.org/3/movie/"
    
}

enum Category {
    case trending
    case upcoming
}

class APIManager {
    static let shared = APIManager()
    func requestData(ofType category: Category,
                     completion: @escaping (Result<APIResponse, Error>) -> Void) {

        let urlString: String
        switch category {
        case .trending:
            urlString = "\(Constants.base)trending?api_key=\(Constants.KEY)&language=en-US"
        case .upcoming:
            urlString = "\(Constants.base)upcoming?api_key=\(Constants.KEY)&language=en-US&page=1"
        default:
            print("Loool")

        }
        
        guard let URL = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL)) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
