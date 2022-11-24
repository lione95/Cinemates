//
//  MovieResponseResults.swift
//  Cinemates
//
//  Created by Mattia Golino on 08/11/22.
//

import Foundation

struct MovieResponseResults: Codable, Identifiable {
    
    let for_adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Float?
    let vote_count: Int?
    
    enum CodingKeys: String, CodingKey{
        case for_adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case id = "id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.for_adult = try container.decodeIfPresent(Bool.self, forKey: .for_adult)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.genre_ids = try container.decodeIfPresent([Int].self, forKey: .genre_ids)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.original_language = try container.decodeIfPresent(String.self, forKey: .original_language)
        self.original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.vote_average = try container.decodeIfPresent(Float.self, forKey: .vote_average)
        self.vote_count = try container.decodeIfPresent(Int.self, forKey: .vote_count)
    }
}
