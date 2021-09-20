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
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    var imageMovie: String = ""
    var originalTitle: String = ""
    var popularityScore: Double = 0
    var date: String = ""
    var overview: String = ""
    var adult: Bool = false
    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTitleLabel.text = originalTitle
        popularityLabel.text = "⭐️ \(popularityScore)"
        releaseDateLabel.text = date
        overviewLabel.text = overview
        adultLabel.text = "+18: \(adult)"
        languageLabel.text = "Original language: \(language.uppercased())"
        
    }
}
