//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 17/9/21.
//

import Foundation
import UIKit

class MovieDetails: UIViewController {
    
    @IBOutlet weak var imageMovieLabel: UIImageView!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var starRatingLabel: UILabel!
    
    var imageMovie: UIImage?
    var originalTitle: String = ""
    var date: String = ""
    var overview: String = ""
    var adult: Bool = false
    var language: String = ""
    var voteCount: Int = 0
    var starRating: Double = 0.0
    let rating = StarsRating()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTitleLabel.text = originalTitle
        releaseDateLabel.text = date
        overviewLabel.text = overview
        if adult == true {
            adultLabel.text = "+18: Yes" }
        else {
            adultLabel.text = "+18: No"
        }
        languageLabel.text = language.uppercased()
        imageMovieLabel.image = imageMovie
        voteCountLabel.text = "🧡 \(voteCount)"
        starRatingLabel.text = rating.showVoteAverage(voteAverage: starRating)
        
    }
}
