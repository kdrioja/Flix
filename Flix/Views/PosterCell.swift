//
//  PosterCell.swift
//  Flix
//
//  Created by user145766 on 9/21/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    var movie: Movie! {
        willSet(newMovie) {
            posterImageView.af_setImage(withURL: newMovie.posterURL!)
        }
    }
    
    @IBOutlet weak var posterImageView: UIImageView!
}
