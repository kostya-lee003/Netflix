//
//  Extensions.swift
//  NetflixClone
//
//  Created by Kostya Lee on 09/03/22.
//

import Foundation

extension String {
    func correctTextIfNeeded() -> Self {
        self + ""
    }
}


extension URL {
    static var trending: Self {
        URL(string: "\(Constants.baseURL)3/trending/movie/day?api_key=\(Constants.API_KEY)&page=1")!
    }
    
    static var upcoming: Self {
        URL(string: "\(Constants.baseURL)3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1")!
    }
    
    static var top_rated: Self {
        URL(string: "\(Constants.baseURL)3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1")!
    }
    
    // A url to a single movie for header view in RecommendationsViewController
    static var headerMovie: Self {
        URL(string: "\(Constants.baseURL)3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&pages=1&total_results=1")!
    }
//    static func search(for query: String) -> Self {
//        return
//    }
    
}
