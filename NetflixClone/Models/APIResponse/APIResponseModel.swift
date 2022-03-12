//
//  APIResponseModel.swift
//  NetflixClone
//
//  Created by Kostya Lee on 08/03/22.
//

import Foundation

struct MovieAPI: Codable {
    let homepage: String?
    let id: Int?
    let original_title: String?
    let overview: String?
    let release_date: String?
    let vote_average: Double?
}

/*
 homepage = "https://www.warnerbros.com/movies/mad-max-fury-road";
 id = 76341;
 "imdb_id" = tt1392190;
 "original_language" = en;
 "original_title" = "Mad Max: Fury Road";
 overview = "An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order.";
 popularity = "104.187";
 "poster_path" = "/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg";
 "release_date" = "2015-05-13";
 "vote_average" = "7.5";
 "vote_count" = 19083;
 */

// The json response of upcoming, trending category
struct CategoryAPI: Codable {
    var page: Int?
    var results: [MovieAPI]
    var total_results: Int?
    var total_pages: Int?
}
