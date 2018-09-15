//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by user145766 on 9/15/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        
        
        
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
                let movies = dataDictionary["results"] as! [[String: Any]]
                
                for movie in movies {
                    let title = movie["title"] as! String
                    print(title)
                }
                //print(dataDictionary)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
