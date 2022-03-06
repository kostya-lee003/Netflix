//
//  Movie.swift
//  NetflixClone
//
//  Created by Kostya Lee on 03/03/22.
//

import UIKit

class Movie {
    private let name: String
    private let description: String
    private let numberOfDownloads: Int
    private let image: UIImage
    private let videoSource: String
    
    public init(name: String, description: String, numberOfDownloads: Int = 0, image: UIImage, videoSource: String = "no video yet") {
        self.name = name
        self.description = description
        self.numberOfDownloads = numberOfDownloads
        self.image = image
        self.videoSource = videoSource
    }
    
    public init() {
        self.name = "Movie name"
        self.description = "This is a movie description. It should contain detailed information about specific film."
        self.numberOfDownloads = Int.random(in: 1...12)
        self.image = UIImage(systemName: "photo.on.rectangle.angled")!
        self.videoSource = "Video/source.com"
    }
    
}
