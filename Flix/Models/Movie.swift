//
//  Movie.swift
//  Flix
//
//  Created by user145766 on 10/9/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var overview: String
    var posterURL: URL?
    var backdropURL: URL?
    var releaseDate: String
    
    /*
     enum MovieKeys{
     static let title = "title"
     static let releaseDate = "release_date"
     static let overview = "overview"
     static let backdropPath = "backdrop_path"
     static let posterPath = "poster_path"
     }
     */
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        
        let posterPath = dictionary["poster_path"] as? String ?? ""
        let backdropPath = dictionary["backdrop_path"] as? String ?? ""
        let baseURL = "https://image.tmdb.org/t/p/w500"
        posterURL = URL(string: baseURL + posterPath)!
        backdropURL = URL(string: baseURL + backdropPath)!
        
        
        /*
         let posterPath = movie["poster_path"] as! String
         let baseURL = "https://image.tmdb.org/t/p/w500"
         let posterURL = URL(string: baseURL + posterPath)! //unwrap with a bang
         */
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
