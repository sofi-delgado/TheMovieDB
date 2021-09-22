//
//  PosterPath.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 20/9/21.
//

import Foundation
import UIKit
//https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg

class ImageConverter {
    let imageUrlString: String = ""
    
    
    func convertURLToImage(imageUrlString: String) -> Data{
        let imageUrl = URL(string: imageUrlString)!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        return imageData
    }
    
}
