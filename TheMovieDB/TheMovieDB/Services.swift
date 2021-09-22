//
//  Services.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 15/9/21.
//

import Foundation
import Alamofire

let urlString = "https://api.themoviedb.org/3/list/3?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"

class FetchData: DataManager {
    let movieProperties: MoviesList? = nil
    var movies: MoviesList?
    var items: [MovieProperties] = []
    
    func getData(urlString: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
        
    }
    
    private func parseData(data: Data)-> MoviesList?{
        do {
            let response = try JSONDecoder().decode(MoviesList.self, from: data)
            return response
        } catch {
            print(error)
            return movieProperties
        }
        
    }
    
    func getMoviesList(completionHandler: @escaping (MoviesList?) -> Void) {
        getData(urlString: urlString) { [self] result in
            guard let result = result else {
                completionHandler(movieProperties)
                return
            }
            let movieList = self.parseData(data: result)
            completionHandler(movieList)
        }
        
    }
    public func showAllTheMovies(reloadHandler: @escaping () -> Void) {
        getMoviesList{ [weak self] movies in
            self?.movies = movies
            self?.items = movies!.items
            reloadHandler()
        }
    }
    func showItems() {
        items = movies!.items
    }
    
    
    
}
