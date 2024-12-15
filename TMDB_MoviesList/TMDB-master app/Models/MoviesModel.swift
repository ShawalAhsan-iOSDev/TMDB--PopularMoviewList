//
//  MoviesModel.swift
//  TMDB_MoviesList
//
//  Created by mac os on 13/12/2024.
//

import Foundation


struct MoviesListModel: Codable , Hashable{
    
    let page : Int
    let results : [MoviesModel]?
    let total_pages : Int
    let total_results : Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case total_pages
        case total_results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try values.decodeIfPresent(Int.self, forKey: .page) ?? 0
        self.results = try values.decodeIfPresent([MoviesModel].self, forKey: .results) ?? []
        self.total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages) ?? 0
        self.total_results = try values.decodeIfPresent(Int.self, forKey: .total_results) ?? 0
        
    }
    
}


struct MoviesModel : Codable, Hashable{
    
    let adult : Bool
    var backdrop_path : String
    let genre_ids : [Int]
    let id : Int
    let original_language : String
    let original_title : String
    let overview : String
    let popularity : Double
    let poster_path : String
    let release_date : String
    let title : String
    let video : Bool
    let vote_average : Double
    let vote_count : Double
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case id
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case release_date
        case title
        case video
        case vote_average
        case vote_count
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try values.decodeIfPresent(Bool.self, forKey: .adult) ?? false
        self.backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path) ?? ""
        self.genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids) ?? []
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.original_language = try values.decodeIfPresent(String.self, forKey: .original_language) ?? ""
        self.original_title = try values.decodeIfPresent(String.self, forKey: .original_title) ?? ""
        self.overview = try values.decodeIfPresent(String.self, forKey: .overview) ?? "Tittle missing"
        self.popularity = try values.decodeIfPresent(Double.self, forKey: .popularity) ?? 0.0
        self.poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path) ?? ""
        self.release_date = try values.decodeIfPresent(String.self, forKey: .release_date) ?? ""
        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.video = try values.decodeIfPresent(Bool.self, forKey: .video) ?? false
        self.vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average) ?? 0
        self.vote_count = try values.decodeIfPresent(Double.self, forKey: .vote_count) ?? 0
    }
}

