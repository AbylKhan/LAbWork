//
//  MovieTableViewCell.swift
//  TableView
//
//  Created by Abylaikhan Koshanov on 4/4/20.
//  Copyright © 2020 Abylaikhan Koshanov. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    var movie: Movie!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        self.titleLabel.text = movie.title
        self.yearLabel.text = movie.year
        
       ImageService.shared.downloadImage(url: movie.posterURL) { image in
                  self.posterImageView.image = image
              }
    }
}
