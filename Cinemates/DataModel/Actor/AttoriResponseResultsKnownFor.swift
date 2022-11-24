//
//  AttoriResponseResultsKnownFor.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import Foundation

struct AttoriResponseResultsKnownFor: Codable, Identifiable{
    
    var adult: Bool?
    var backdrop_path: String?
    var genre_id: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    
    enum CodingKeys: String, CodingKey{
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_id = "genre_id"
        case id = "id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.genre_id = try container.decodeIfPresent([Int].self, forKey: .genre_id)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.original_language = try container.decodeIfPresent(String.self, forKey: .original_language)
        self.original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.vote_average = try container.decodeIfPresent(Float.self, forKey: .vote_average)
    }
    
}
