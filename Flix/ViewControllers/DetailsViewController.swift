//
//  DetailsViewController.swift
//  Flix
//
//  Created by user145766 on 9/21/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit
/*
enum MovieKeys{
    static let title = "title"
    static let releaseDate = "release_date"
    static let overview = "overview"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}
*/
class DetailsViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if movie != nil {
            titleLabel.text = movie?.title
            releaseDateLabel.text = movie?.releaseDate
            overviewLabel.text = movie?.overview
            posterImageView.af_setImage(withURL: (movie?.posterURL)!)
            backdropImageView.af_setImage(withURL: (movie?.backdropURL)!)
        }
    }
}


/*
 var movie: [String: Any]?
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 if let movie = movie {
 titleLabel.text = movie[MovieKeys.title] as? String
 releaseDateLabel.text = movie[MovieKeys.releaseDate] as? String
 overviewLabel.text = movie[MovieKeys.overview] as? String //optional nil
 let backdropPathString = movie[MovieKeys.backdropPath] as! String //force unwrap
 let posterPathString = movie[MovieKeys.posterPath] as! String
 let baseURLString = "https://image.tmdb.org/t/p/w500"
 
 let backdropURL = URL(string: baseURLString + backdropPathString)!
 backdropImageView.af_setImage(withURL: backdropURL)
 
 let posterURL = URL(string: baseURLString + posterPathString)!
 posterImageView.af_setImage(withURL: posterURL)
 
 }
 }
 */
