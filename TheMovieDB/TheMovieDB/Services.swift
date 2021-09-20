//
//  Services.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 15/9/21.
//

import Foundation
import Alamofire

let urlString = "https://api.themoviedb.org/3/list/3?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"

class FetchData {
    let movieProperties: DCMovies? = nil
    
    public func getMoviesList(completionHandler: @escaping (DCMovies?) -> Void) {
        getData(urlString: urlString) { [self] result in
            guard let result = result else {
                completionHandler(movieProperties)
                return
            }
            let movieList = self.parseData(data: result)
            completionHandler(movieList)
        }
        
    }
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
    
    public func parseData(data: Data)-> DCMovies?{
        do {
            let response = try JSONDecoder().decode(DCMovies.self, from: data)
            return response
        } catch {
            print(error)
            return movieProperties
        }
        
    }
    
}
