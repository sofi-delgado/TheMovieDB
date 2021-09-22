//
//  DataModel.swift
//  TheMovieDB
//
//  Created by Sofia Belen Delgado Gonzalez on 15/9/21.
//

import Foundation

struct MoviesList: Decodable{
    let createdBy: String
    let description: String
    let favoriteCount: Int
    let id: String
    let items: [MovieProperties]
    let itemCount: Int
    let iso_639_1: String
    let name: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case description
        case favoriteCount = "favorite_count"
        case id
        case items
        case itemCount = "item_count"
        case iso_639_1
        case name
        case posterPath = "poster_path"
    }
}

struct MovieProperties: Decodable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String?
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let mediaType: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey{
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        }
    }

