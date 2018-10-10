//
//  SuperheroViewController.swift
//  Flix
//
//  Created by user145766 on 9/21/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

//enum MovieKeys{
//    static var posterPath = "poster_path"
//}

class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine: CGFloat = 2
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let cellWidth = (collectionView.frame.width - interItemSpacingTotal) / cellsPerLine
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 3 / 2)
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let movie = movies[indexPath.item]
        cell.movie = movie
        /*
        if let posterPathString = movie[MovieKeys.posterPath] as? String {
            //will only run if the poster path is not nil
            
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
         */
        return cell
    }
    
    func fetchMovies() {
        MovieApiManager().superheroMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
            }
        }
        
        /*
        //activityIndicator.startAnimating()
        
        //! ("banger") causes it to force unwrap. if it was nil your app would crash
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        //cachecPolicy is this way so that it pulls data each time from the network for testing purposes
        //last field is in seconds
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //this coordinates all our network requests
        //delegateQueue: when our network request returns it'll jump back in our main thread
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //task to actually go out and get the data
        let task = session.dataTask(with: request) { (data, response, error) in
            //this will run when the network request returns
            //netwrok requests are asynchronous
            //our main queue handles ui updates
            //if they weren't netwrok requests would clog up the pipe
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //cast this data in order to get it from JSON form
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies as! [Movie]
                
                self.collectionView.reloadData()
                
                //self.refreshControl.endRefreshing()
                //self.activityIndicator.stopAnimating()
            }
        }
        task.resume()
        */
    }
    
}
