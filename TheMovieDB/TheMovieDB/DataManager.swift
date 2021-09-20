//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 15/9/21.
//

import Foundation

class DataManager{
    let fetchData = FetchData()
    var movies: DCMovies?
    var items: [MovieProperties] = []
    
    public func showAllTheMovies(reloadHandler: @escaping () -> Void) {
        fetchData.getMoviesList{ [weak self] movies in
            self?.movies = movies
            self?.items = movies!.items
            reloadHandler()
        }
    }
    func showItems() {
        items = movies!.items
    }
    
}
