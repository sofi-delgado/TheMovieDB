//
//  Protocols.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 22/9/21.
//

import Foundation
protocol DataManager {
 func showAllTheMovies(reloadHandler: @escaping () -> Void)

}
