//
//  MovieCell.swift
//  Flix
//
//  Created by user145766 on 9/15/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    var movie: Movie! {
        willSet(newMovie) {
            titleLabel.text = newMovie.title
            overviewLabel.text = newMovie.overview
            posterImageView.af_setImage(withURL: newMovie.posterURL!)
        }
    }
    

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
