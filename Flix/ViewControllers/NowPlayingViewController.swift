//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by user145766 on 9/15/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //var movies: [[String: Any]] = []
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl! //! is called implicitely optional mening that when its referenced its going to unwrap it and it better have something in it or it will crash
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl() //() to instantiate
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0) //0 for the very top
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.dataSource = self
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    
    func fetchMovies() {
        activityIndicator.startAnimating()
        
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        
        /*
        
        //! ("banger") causes it to force unwrap. if it was nil your app would crash
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
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
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                self.movies = Movie.movies(dictionaries: movieDictionaries)
                /*
                self.movies = []
                for dictionary in movieDictionaries {
                    let movie = Movie(dictionary: dictionary)
                    self.movies.append(movie)
                }
                */
                
                self.tableView.reloadData()
                
                self.refreshControl.endRefreshing()
                
                self.activityIndicator.stopAnimating()
                
                /*
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                 
                 self.movies = []
                 for dictionary in movieDictionaries {
                 let movie = Movie(dictionary: dictionary)
                 self.movies.append(movie)
                 }
                 */
                
                /*
                 for movie in movies {
                 let title = movie["title"] as! String
                 print(title)
                 }*/
                //print(dataDictionary)
            }
        }
        task.resume()
        
        */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = movies[indexPath.row]
        return cell
        
        
        
        /*
        
        //the table view calls this method every time it needs a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        cell.posterImageView.af_setImage(withURL: movie.posterURL!)
        /*
        let posterPath = movie["poster_path"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURL + posterPath)! //unwrap with a bang
        cell.posterImageView.af_setImage(withURL: posterURL)
        */
        //print(overview)
        
        return cell
 
        */
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailsViewController
            detailViewController.movie = movie
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
