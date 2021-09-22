//
//  StarsRating.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 20/9/21.
//

import Foundation

class StarsRating {
    
    var stringAverage: String = ""
    
    func showVoteAverage(voteAverage: Double) ->String{
        let average = voteAverage
        switch average {
        case 0.0...2.0:
            stringAverage = "⭐️"
        case 2.1...4.0:
            stringAverage = "⭐️⭐️"
        case 4.1...6.0:
            stringAverage = "⭐️⭐️⭐️"
        case 6.1...8.0:
            stringAverage = "⭐️⭐️⭐️⭐️"
        default:
            stringAverage = "⭐️⭐️⭐️⭐️⭐️"
        }
        return stringAverage
    }
}

